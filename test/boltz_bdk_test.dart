import 'dart:async';
import 'dart:ffi';

import 'package:boltz_dart/boltz_dart.dart';
import 'package:boltz_dart/src/types/swap.dart';
import 'package:boltz_dart/src/types/swap_status_response.dart';
import 'package:boltz_dart/src/utils/http.dart';
// import 'package:flutter_test/flutter_test.dart';
import 'package:test/test.dart';
import 'dart:io';
import 'package:bdk_flutter/bdk_flutter.dart';

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
const fundingWalletMnemonic = 'fossil install fever ticket wisdom outer broken aspect lucky still flavor dial';

late Wallet wallet;
late Blockchain blockchain;

void main() {
  setUpAll(() async {
    blockchain = await setupBlockchain();
    wallet = await setupWallet(blockchain);
  });
  tearDownAll(() {
    // TODO: to do anything with BDK?
  });

  /*
  test('Exp: Send', () async {
    final resp = await sendBitcoin("tb1pek4sdtgpgzuzl0w53nk05lcqndmxfj7dsywytl4z5x86sjvk8yts4pu2ed", 3000, blockchain);
    print(resp);
  });
  */

  group('BTC-LN Submarince', () {
    test('Neg: Send less on-chain sats', () async {
      // Setup a fresh Invoice here
      const invoice =
          "lntb560u1pjmeh6epp50ua94fn7q6txruqvtu5tthhxrz6d24nhyfl7jvmww4nmp0s2dcnqdqqcqzzsxqyjw5qsp57d00xkkazm5eztzmwamz3vt9sdhe7xez9tky5hz37f26fp2z3efq9qyyssqnmxsdkv3llgr3tpqvknn4x8u0hcawmwcez44xtckek78d7t4t3xktue0msvpv4zfznc8ft320ppvu2jmxpu74t0zjfwe74rpspctx0gp62zj36";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);

      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      final outAddress = paymentDetails.split(":")[0];
      final outAmount = int.parse(paymentDetails.split(":")[1]);
      print("Expected: $outAmount. But sending only 5000 to: $outAddress");
      final txid = await sendBitcoin(outAddress, 5000, blockchain);
      print('TXID: $txid');

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
      // Set invoice expiry time to 1m
      const invoice =
          "lntb541230n1pjmeerzpp5rcdxudrgjrq82u5lfwg3madzf2tg5egmwl7uy4dyjshfv8kaq49sdqqcqzzsxqzpusp5wtyn33gnfsr4szjwzfsrxekpg9kmmlr60a0973r7p78vznqk7jas9qyyssqzsmza4vn2xj8g9ruxv5m4umtwcsqzmqxedww0sxfe662zqfw8wypywpagltj669323rl2yhwk24pm8nyrxk2r50qk2uq9jc4fv0jt9cp0natwq";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      final outAddress = paymentDetails.split(":")[0];
      final outAmount = int.parse(paymentDetails.split(":")[1]);
      print('Sending $outAmount after expiry time (1m) to: $outAddress');
      print('Waiting for 1 mins');
      await Future.delayed(Duration(minutes: 1));
      final txid = await sendBitcoin(outAddress, outAmount, blockchain);
      print('TXID: $txid');

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
          "lntb531230n1pjmee7hpp5vwgtceknsys7v9rhcw7fwv6tzjnulvetdcvj2nvhentn7clxumlsdqqcqzzsxqyjw5qsp5anm5mydp5ve6s7366eugvjjnzktl38ewzx40al539c4rn0ty4qlq9qyyssqy6vlfe6d76c45d33nljqxv39sxpkyu0p4d92p5904nygpxc7fkc3w78k69jkfyhlxm2dg4xudje9ej3ujgt9kr4vacgpndhr5z2mencpjsupsw";

      BtcLnSwap btcLnSubmarine = await setupSubmarine(invoice);
      final paymentDetails = await btcLnSubmarine.paymentDetails();
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

      final swap = btcLnSubmarine.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      expect(swap.keys.secretKey, expectedSecretKey);

      final outAddress = paymentDetails.split(":")[0];
      final outAmount = int.parse(paymentDetails.split(":")[1]);
      print('Sending $outAmount to: $outAddress');
      final txid = await sendBitcoin(outAddress, outAmount, blockchain);
      print('TXID: $txid');

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
    test('Positive', () async {
      int outAmount = 55000;

      AddressInfo addr1 = await wallet.getAddress(addressIndex: AddressIndex.lastUnused());
      String outAddress = addr1.address;

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

      expect(receivedEvents[0].status, equals(SwapStatus.swapCreated));
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

Future<Blockchain> setupBlockchain() async {
  blockchain = await Blockchain.create(
      config: BlockchainConfig.electrum(
          config: ElectrumConfig(
              stopGap: 10, timeout: 5, retry: 5, url: "ssl://electrum.blockstream.info:60002", validateDomain: true)));
  return blockchain;
}

Future<Wallet> setupWallet(Blockchain blockchain) async {
  final mnemonic = await Mnemonic.fromString(fundingWalletMnemonic);
  final descriptorSecretKey = await DescriptorSecretKey.create(network: Network.Testnet, mnemonic: mnemonic);
  final externalDescriptor = await Descriptor.newBip84(
      secretKey: descriptorSecretKey, network: Network.Testnet, keychain: KeychainKind.External);
  final internalDescriptor = await Descriptor.newBip84(
      secretKey: descriptorSecretKey, network: Network.Testnet, keychain: KeychainKind.Internal);

  final wallet = await Wallet.create(
      descriptor: externalDescriptor,
      changeDescriptor: internalDescriptor,
      network: Network.Testnet,
      databaseConfig: const DatabaseConfig.memory());
  final _ = await wallet.sync(blockchain);

  return wallet;
}

Future<String> sendBitcoin(String address, int amount, Blockchain blockchain) async {
  final bdkAddress = await Address.create(address: address);
  final script = await bdkAddress.scriptPubKey();
  final txBuilder = TxBuilder();
  final txBuilderResult = await txBuilder.feeRate(2).addRecipient(script, amount).finish(wallet);

  final psbt = await wallet.sign(psbt: txBuilderResult.psbt);
  final psbtStruct = PartiallySignedTransaction(psbtBase64: psbt.psbtBase64);
  final tx = await psbtStruct.extractTx();

  await blockchain.broadcast(tx);
  final txid = await tx.txid();

  return txid;
}
