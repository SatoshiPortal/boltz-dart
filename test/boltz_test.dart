// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import '../lib/bridge_generated.dart';
import '../lib/ffi.dart';
import 'package:test/test.dart';

void main() {
  late BoltzDartImpl ffi;

  setUp(() {
    ffi = BoltzDartImpl(apiLinux);
  });

  group('BTC-LN SUBMARINE SWAP', () {
    test('Get fee estimation', () async {
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      final fees = await ffi.swapFeesStaticMethodApi(boltzUrl: boltzUrl);
      print(
          "USER MUST ACCEPT FEE TO PROCEED:\nbtc: ${fees.$1} sats/byte\nlbtc: ${fees.$2} sats/byte");
      expect((fees.$1 > 0.0), true);
      expect((fees.$2 > 0.0), true);
    });
    test('Test create swap', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = Network.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';
      // CREATE NEW INVOICE PER TEST:
      // ORDER HALF A TON OF COFFEE AT: https://starblocks.acinq.co/
      const invoice =
          "lntb30m1pje68ahpp5jye9st2ajtl5ldsmspehmn803hj30mvh566mzw90zx9uewxx43cqdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5lqkdgaduy7qsrpe7edtrhadp4z4rm222hh90vt79j5uarnnfjnhs0hjalp2pnwg54pmm6hvqa8d4tmwcjdgjrm0sg58fj7xqm00hg6wqj069e9tmlj0r6kr8fqkt8qyhwr8ysdmwck86p8c6z4g0dr6u6vcpeu6z5f";
      try {
        final btcLnSubmarineSwap = await ffi.newBtcLnSubmarineStaticMethodApi(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );
        const expectedSecretKey =
            "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

        print("SWAP CREATED SUCCESSFULLY: ${btcLnSubmarineSwap.id}");

        expect(btcLnSubmarineSwap.keys.secretKey, expectedSecretKey);

        // this should be a method on BtcLnSwap
        // btcLnSubmarineSwap.status
        // final status = await ffi.swapStatusStaticMethodApi(
        //     boltzUrl: boltzUrl, id: btcLnSubmarineSwap.id);
        // print("SWAP STATUS: $status");

        // this should be a method on BtcLnSwap
        // btcLnSubmarineSwap.paymentDetails
        print(
            "PAYMENT DETAILS: ${btcLnSubmarineSwap.onchainAddress}:${btcLnSubmarineSwap.outAmount} sats");
      } catch (e) {
        print((e as BoltzError).kind);
        print((e as BoltzError).message);
      }

      // const expectedSecret =
      //     '9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9';
      // expect(btcLnSubmarineSwap.keys.secretKey, expectedSecret);
    });
  });
}
