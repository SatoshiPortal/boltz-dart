import 'dart:async';

import 'package:boltz_dart/boltz_dart.dart';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:boltz_dart/src/types/swap_status_response.dart';
import 'package:boltz_dart/src/utils/http.dart';
import 'package:test/test.dart';
import 'dart:io';

import 'test_data.dart';

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
// const boltzUrl = 'https://testnet.boltz.exchange/api';

const lnetwork = Chain.LiquidTestnet;
const testTimeout = Timeout(Duration(minutes: 30));

void main() {
  test('Swap status string', () {
    final status = SwapStatus.invoiceFailedToPay;
    expect(status.asString, 'Invoice failed to pay');
  });

  test('FEE & LIMITS', () async {
    const boltzUrl = 'https://api.testnet.boltz.exchange';
    final amount = 100000;
    final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

    expect((fees.btcReverse.boltzFees > 0.0), true);
    expect((fees.btcSubmarine.boltzFees > 0.0), true);
  });

  test('DECODE EXPIRED BOLT11', () async {
    final decoded = await Bolt11Invoice.decode(invoice: expiredBolt11Invoice);
    assert(decoded.isExpired);
    print('$decoded');
  });
  group('BTC-LN Submarince', () {
    test('Neg: Minimum limit (50k sats)', () async {
      // An invoice with <50k sats
      await expectLater(() async => await setupSubmarine(invoice123), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$invoice123Amount is less than minimal of 50000"}';
      })));
    });

    test('Neg: Maximum limit (25m sats)', () async {
      // An invoice with >25m sats
      await expectLater(() async => await setupSubmarine(invoice26m), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"$invoice123Amount is exceeds maximal of 25000000"}';
      })));
    });

    test('Neg: Used Invoice', () async {
      await expectLater(() async => await setupSubmarine(usedInvoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"a swap with this invoice exists already"}';
      })));
    });

    test('Neg: Expired invoice', () async {
      await expectLater(() async => await setupSubmarine(expiredInvoice), throwsA(predicate((e) {
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"the provided invoice expired already"}';
      })));
    });

    test('Neg: Invalid invoice', () async {
      await expectLater(() async => await setupSubmarine(invalidInvoice), throwsA(predicate((e) {
        print(e);
        return e is BoltzError &&
            e.kind == 'BoltzApi' &&
            e.message == '{"error":"No separator character for lntbinvalidinvoice"}';
      })));
    });

    test('Neg: Send less on-chain sats', () async {
      BtcLnBoltzSwap btcLnSubmarine = await setupSubmarine(workingFreshInvoice1);

      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats less than: $paymentDetails");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();

      var sub = api.subscribeSwapStatus([swap.id]).listen((event) {
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
      BtcLnBoltzSwap btcLnSubmarine = await setupSubmarine(invoiceWith1minExpiry);
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats after expiry time: $paymentDetails");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) {
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
      BtcLnBoltzSwap btcLnSubmarine = await setupSubmarine(workingFreshInvoice2);
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Send sats: $paymentDetails");
      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnClaimed) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.txnConfirmed));
      expect(receivedEvents[3].status, equals(SwapStatus.invoicePending));
      expect(receivedEvents[4].status, equals(SwapStatus.invoicePaid));
      expect(receivedEvents[5].status, equals(SwapStatus.txnClaimed));
    }, skip: true, timeout: testTimeout);
  });

  group('LN-BTC Reverse Submarine', () {
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
      BtcLnBoltzSwap btcLnSubmarine = await setupReverse(btcLnReverseSwapAmount);

      const expectedSecretKey = "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      print("Pay this invoice: ${swap.invoice}");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnMempool) {
          await Future.delayed(Duration(seconds: 20));

          final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: btcLnReverseSwapAmount);
          final claimFeesEstimate = fees.btcReverse.claimFeesEstimate;

          String txnId = await btcLnSubmarine.claim(outAddress: btcReceiveAddress, absFee: claimFeesEstimate);
          print(txnId);
        }
        if (event.status == SwapStatus.invoiceSettled) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      // expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[0].status, equals(SwapStatus.swapCreated));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.invoiceSettled));
    }, skip: true, timeout: testTimeout);
  });

  group('LBTC-LN Submarine', () {
    test('Positive', () async {
      const invoice =
          'lntb22u1pju9aukpp5wpxqwx7svpcctyc6x5l0xcl45epcl072j9spvdes7uhvwpa4dmdsdqqcqzzsxqyjw5qsp5waswjm3sr9amvy5s8caj5ec28at2x5aek8gl2u787hej59txlm8s9qyyssqrhvelx58p5338lq5lrnwlsz6l6t5psj4c9m2yrgjh66lhyu7y5fywsv0hruc5ccvptrgy09fpah4ng2wcg8fzf79d8vwqwfeksnq9fcpsvhu3m';

      final btcLnSubmarineSwap = await setupLSubmarine(invoice);

      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarineSwap.lbtcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");

      expect(swap.keys.secretKey, expectedSecretKey);

      final paymentDetails = await btcLnSubmarineSwap.paymentDetails();

      print("Send l-sats: $paymentDetails");
      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnClaimed) {
          completer.complete();
        }
      });
      await completer.future;

      await sub.cancel();

      expect(receivedEvents[0].status, equals(SwapStatus.invoiceSet));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.invoicePending));
      expect(receivedEvents[3].status, equals(SwapStatus.invoicePaid));
      // expect(receivedEvents[4].status, equals(SwapStatus.txnClaimPending));
      expect(receivedEvents[4].status, equals(SwapStatus.txnClaimed));
    }, skip: true, timeout: testTimeout);
  });

  group('LN-LBTC Reverse Submarine', () {
    test('Positive', () async {
      const outAmount = 3100;
      const outAddress =
          'tlq1qqf9zqefh7jwzvu56gssqh7ayea2cmphhcqmfleg2zg6t5r70zfa2ukmvg5cmp5g33nar2xkx57edghhpc9nj56plk7ch7ppuk';

      final lbtcLnSubmarineSwap = await setupLReverse(outAmount);
      const expectedSecretKey = "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";

      final swap = lbtcLnSubmarineSwap.lbtcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");

      expect(swap.keys.secretKey, expectedSecretKey);

      print("Pay this invoice: ${swap.invoice}");

      var completer = Completer();
      var receivedEvents = <SwapStatusResponse>[];
      final api = await BoltzApi.newBoltzApi();
      var sub = api.subscribeSwapStatus([swap.id]).listen((event) async {
        receivedEvents.add(event);
        if (event.status == SwapStatus.txnConfirmed) {
          await Future.delayed(Duration(seconds: 300));

          final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: outAmount);
          final claimFeesEstimate = fees.lbtcReverse.claimFeesEstimate;

          String txnId = await lbtcLnSubmarineSwap.claim(outAddress: outAddress, absFee: claimFeesEstimate);
          print(txnId);
        }
        if (event.status == SwapStatus.invoiceSettled) {
          completer.complete();
        }
      });

      await completer.future;

      await sub.cancel();
      print(receivedEvents);

      expect(receivedEvents[0].status, equals(SwapStatus.swapCreated));
      expect(receivedEvents[1].status, equals(SwapStatus.txnMempool));
      expect(receivedEvents[2].status, equals(SwapStatus.txnConfirmed));
    }, skip: true, timeout: testTimeout);
  });
}

Future<BtcLnBoltzSwap> setupSubmarine(String invoice) async {
  final amount = 100000;
  final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

  final btcLnSubmarineSwap = await BtcLnBoltzSwap.newSubmarine(
    mnemonic: mnemonic,
    index: index,
    invoice: invoice,
    network: network,
    electrumUrl: electrumUrl,
    boltzUrl: boltzUrl,
    pairHash: fees.btcPairHash,
  );

  return btcLnSubmarineSwap;
}

Future<BtcLnBoltzSwap> setupReverse(int outAmount) async {
  final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: outAmount);

  final btcLnSubmarineSwap = await BtcLnBoltzSwap.newReverse(
      mnemonic: mnemonic,
      index: index,
      outAmount: outAmount,
      network: network,
      electrumUrl: electrumUrl,
      boltzUrl: boltzUrl,
      pairHash: fees.btcPairHash);

  return btcLnSubmarineSwap;
}

Future<LbtcLnBoltzSwap> setupLSubmarine(String invoice) async {
  final amount = 100000;
  final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

  final lbtcLnSubmarineSwap = await LbtcLnBoltzSwap.newSubmarine(
      mnemonic: mnemonic,
      index: index,
      invoice: invoice,
      network: lnetwork,
      electrumUrl: electrumUrl,
      boltzUrl: boltzUrl,
      pairHash: fees.lbtcPairHash);

  return lbtcLnSubmarineSwap;
}

Future<LbtcLnBoltzSwap> setupLReverse(int amount) async {
  final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

  final lbtcLnSubmarineSwap = await LbtcLnBoltzSwap.newReverse(
      mnemonic: mnemonic,
      index: index,
      outAmount: amount,
      network: lnetwork,
      electrumUrl: electrumUrl,
      boltzUrl: boltzUrl,
      pairHash: fees.lbtcPairHash);

  return lbtcLnSubmarineSwap;
}
