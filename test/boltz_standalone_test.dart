import 'dart:async';

import 'package:boltz_dart/boltz_dart.dart';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:boltz_dart/src/types/swap_status_response.dart';
import 'package:boltz_dart/src/utils/http.dart';
import 'package:test/test.dart';
import 'dart:io';

void countdown(int totalSeconds) {
  for (var i = totalSeconds; i >= 0; i--) {
    // Constructing the countdown message
    var message = 'Pay invoice within $i seconds';

    // Print the message, overwriting the previous line
    stdout.write('\r$message');
    stdout.flush(); // Ensure the output is written to the terminal immediately
    sleep(Duration(seconds: totalSeconds));
  }
  stdout.writeln('\nInvoice payment period expired.');
}

const mnemonic =
    'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
const index = 0;
const network = Chain.Testnet;
const electrumUrl = 'electrum.bullbitcoin.com:60002';
const boltzUrl = 'https://api.testnet.boltz.exchange';
const testTimeout = Timeout(Duration(minutes: 30));

void main() {
  test('FEE ESTIMATION', () async {
    const boltzUrl = 'https://api.testnet.boltz.exchange';
    final amount = 100000;
    final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

    expect((fees.btcReverse.boltzFees > 0.0), true);
    expect((fees.btcSubmarine.boltzFees > 0.0), true);
  });

  group('BTC-LN Submarince', () {
    test('Neg: Minimum limit (50k sats)', () async {
      // An invoice with <50k sats
      const invoice =
          "lntb1230n1pjmwkxwpp5etvpredwjpwvsrmrcs3l854tcwyz8tnfm453uyp3kcsrmnmu26xsdqqcqzzsxqyjw5qsp5jmejjyf0v6lyn3c5z6uxdslxtnu6t72perfp8ps6ldyen5as9juq9qyyssqtc8409xlyar4vmn70sszyzeu3k28jzlx0k2cjpg6pvh8mdglkn3ymxslmq8entcz56hwu3hx0d8mzjsvtkc3vu9da6j88exflp8urkqppw0vkq";
      const invoiceAmount = 123;

      await expectLater(() async => await setupSubmarine(invoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$invoiceAmount is less than minimal of 50000"}';
      })));
    });

    test('Neg: Maximum limit (25m sats)', () async {
      // An invoice with >25m sats
      const invoice =
          "lntb260m1pjmwkv7pp5g8hy6pe8md7rz6jwcgvntgsqwr2eck0rcvj8trqkuehuvl9g2w4qdqqcqzzsxqyjw5qsp59fq60rmf6mkx9hhkcdw4akl7ksgzl3rfchgj94f6vfwzq9x7wvps9qyyssq2mkjtc67ktcnxf0cch8d66fkxlx9fyryy2k79cqv8gzjxw7wmh7xm3qdra7lawm6nvjrs2zyu50qf428uzqu25mxmvev6zckzt8ew7gp0xfna2";
      const invoiceAmount = 26000000;

      await expectLater(() async => await setupSubmarine(invoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$invoiceAmount is exceeds maximal of 25000000"}';
      })));
    });

    test('Neg: Used Invoice', () async {
      const invoice =
          "lntb510u1pjmwkmspp5hqxwu96lhqzvvv9gxul8memmkj833fsdu32aw4llgf37jrfx0m5qdqqcqzzsxqyjw5qsp55djvsgh0eyypz2l28cyhxajuudy8z27ge5ss82k80kdefzn3de6s9qyyssq9s0lqcr00e0raj86tde8zq6jnft5fq3xyqhjc4jzpcndqvkjtsuh9tmd4rhk52zc6tkgf3h9hk7pcuzxprmsfj5rmghl2jyzga3d8vqq5785ee";

      await expectLater(() async => await setupSubmarine(invoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"a swap with this invoice exists already"}';
      })));
    });

    test('Neg: Expired invoice', () async {
      const invoice =
          "lntb510u1pjm0z48pp5p3frf3ngtfxfu2fpdv5jefdk5d4r5es6ad350jelq64kwj3z7jvqdqqcqzzsxqp9sp5fw6a2zjmlhx59k2x7rmv46aus79walrmlvmqhvpcy0wwhtwx68qs9qyyssqq9denfcmlnf37djfkxu0rr7c5gy0ad969cylhmuzyeusp9g3ecus0zyv4kugdcle438ujnn948whzrtev04sq889lnp959ns6ymdpwcpwvyszt";

      await expectLater(() async => await setupSubmarine(invoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"the provided invoice expired already"}';
      })));
    });

    test('Neg: Invalid invoice', () async {
      const invoice = "lntbinvalidinvoice";

      await expectLater(() async => await setupSubmarine(invoice), throwsA(predicate((e) {
        print(e);
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"No separator character for lntbinvalidinvoice"}';
      })));
    });

    test('Neg: Send less on-chain sats', () async {
      // Setup a fresh Invoice here
      const invoice =
          "lntb525u1pjmke0xpp59hj2fdp5nnjvwtnrvd0r4u36knnmkp3lnyvn4kj70zs8edelvggqdqqcqzzsxqyjw5qsp5zxpqx8cd022kl9x6f0pnz63a5xyuz60v0qwrggw2rkg2q2dfhemq9qyyssq2uxfn8lp984tt8rq3jhxwtx839c7mxdl0k8u07dn2m8ll4lvsa7n7qnwts6w5fp6c6ejhr4fmxmsxn7jjhzywv3sfs6v4rlaz87p6fgpcwtnpy";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);

      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats less than: $paymentDetails");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.getSwapStatusStream(swap.id).listen((event) {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnLockupFailed) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnLockupFailed));

      // TODO: Refund flow goes here
      // expect(receivedEvents[2], equals(SwapStatus.swapRefunded));
    }, skip: true, timeout: testTimeout);

    test('Neg: LN Invoice expires', () async {
      const invoice =
          "lntb545u1pjm0zgkpp5vl6wgpfcuapqd5e2vz3sc064ph76y6kze60jmrvqyk5auzrx6f6qdqqcqzzsxqzpusp55fy9qvqs95qr0xmcn6u4qktwz6at6gcnpl560cjs4htvgw4wj3cs9qyyssqsv0alwgutgqjxpm03e7kf5f66gk4u8adduater9qyg6lrx6pgscxcgx5k2v075qangzjcrx4qjwvcc89txhjyxa6aqe0x37xhnf0maspnud9d8";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);
      final paymentDetails = btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats after expiry time: $paymentDetails");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.getSwapStatusStream(swap.id).listen((event) {
        receivedEvents.add(event);
        if (event.status == SwapStatus.invoiceFailedToPay) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.txnConfirmed));
      expect(receivedEvents[3].status, equals(SwapStatus.invoicePending));
      expect(receivedEvents[4].status, equals(SwapStatus.invoiceFailedToPay));

      // TODO: Refund flow goes here
      // expect(receivedEvents[2], equals(SwapStatus.swapRefunded));
    }, skip: true, timeout: testTimeout);

    test('Positive: Send exact amount or more', () async {
      const invoice =
          "lntb1m1pjmkcg0pp5vsta4epuxy22ksk73n9a39pjkwa64ux5w3wj4sxasm4cqxyze92qdq8w368gaqxqyjw5qcqp2sp5lkac0whuret73z2kfqm7ql20v5myvrxf89y2pqm3xl4r9pxcu26srzjq2gyp9za7vc7vd8m59fvu63pu00u4pak35n4upuv4mhyw5l586dvkf6vkyqq20gqqqqqqqqpqqqqqzsqqc9qyyssqv27kvqsup9h3538zdyz852gpkfthvkvhudqdzj8gdfesaexlquvrhr33x55pnwlv4nd3k7hjmxyvgpwreukzga7kxlhae7dufzawvhqqruaq5e";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);
      final paymentDetails = btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats: $paymentDetails");
      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.getSwapStatusStream(swap.id).listen((event) {
        receivedEvents.add(event);
      });
      await completer.future;

      await sub.cancel();

      // print('receivedEvents: $receivedEvents');

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.txnConfirmed));
      expect(receivedEvents[3].status, equals(SwapStatus.invoicePending));
      expect(receivedEvents[4].status, equals(SwapStatus.invoicePaid));
    }, skip: true, timeout: testTimeout);
  });

  group('LN-BTC Reverse Submarince', () {
    test('Neg: Minimum limit (50k sats)', () async {
      const outAmount = 2500;

      await expectLater(() async => await setupReverse(outAmount), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$outAmount is less than minimal of 50000"}';
      })));
    });

    test('Neg: Maximum limit (25m sats)', () async {
      const outAmount = 26000000;

      await expectLater(() async => await setupReverse(outAmount), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$outAmount is exceeds maximal of 25000000"}';
      })));
    });

    test('Neg: Invalid mnemonic (Not working)', () async {
      const outAmount = 60000;

      try {
        await setupReverse(outAmount);
      } catch (e) {
        print(e);
      }

      /*
        await expectLater(() async => await setupReverse(outAmount), throwsA(predicate((e) {
          print(e);
          return e is BoltzError &&
              e.kind == 'BoltzApi' &&
              e.message == '{"error":"a swap with this invoice exists already"}';
        })));
      */
    }, skip: true);

    test('Positive: ', () async {
      int outAmount = 51000;
      const outAddress = "tb1q5tsjcyz7xmet07yxtumakt739y53hcttmntajq";

      BtcLnSwap btcLnSubmarine = await setupReverse(outAmount);

      const expectedSecretKey = "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Pay this invoice: ${swap.invoice}");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.getSwapStatusStream(swap.id).listen((event) async {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnMempool) {
          await Future.delayed(Duration(seconds: 20));

          final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: outAmount);
          final claimFeesEstimate = fees.btcReverse.claimFeesEstimate;

          String txnId = await btcLnSubmarine.claim(outAddress: outAddress, absFee: claimFeesEstimate);
          print(txnId);
        }
        if (event.status == SwapStatus.invoiceSettled) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.invoiceSettled));
    }, skip: true, timeout: testTimeout);
  });
}

Future<BtcLnSwap> setupSubmarine(String invoice) async {
  final btcLnSubmarineSwap = await BtcLnSwap.newSubmarine(
    mnemonic: mnemonic,
    index: index,
    invoice: invoice,
    network: network,
    electrumUrl: electrumUrl,
    boltzUrl: boltzUrl,
  );

  return btcLnSubmarineSwap;
}

Future<BtcLnSwap> setupReverse(int outAmount) async {
  final btcLnSubmarineSwap = await BtcLnSwap.newReverse(
    mnemonic: mnemonic,
    index: index,
    outAmount: outAmount,
    network: network,
    electrumUrl: electrumUrl,
    boltzUrl: boltzUrl,
  );

  return btcLnSubmarineSwap;
}
