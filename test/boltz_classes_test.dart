import 'package:boltz_dart/bridge_definitions.dart' as bridge;
import 'package:boltz_dart/ffi.dart';
import 'package:boltz_dart/root.dart';
import 'package:test/test.dart';

void main() {
  group('BTC-LN SWAPS', () {
    test('FEE ESTIMATION', () async {
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      final fees = await SwapFees.estimateFee(boltzUrl: boltzUrl);
      print(
          "USER MUST ACCEPT FEE TO PROCEED:\nbtc: ${fees.btc} sats/byte\nlbtc: ${fees.lbtc} sats/byte");
      expect((fees.btc > 0.0), true);
      expect((fees.lbtc > 0.0), true);
    });

    test('SUBMARINE SWAP', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Network.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const invoice =
          "lntb30m1pje68ahpp5jye9st2ajtl5ldsmspehmn803hj30mvh566mzw90zx9uewxx43cqdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5lqkdgaduy7qsrpe7edtrhadp4z4rm222hh90vt79j5uarnnfjnhs0hjalp2pnwg54pmm6hvqa8d4tmwcjdgjrm0sg58fj7xqm00hg6wqj069e9tmlj0r6kr8fqkt8qyhwr8ysdmwck86p8c6z4g0dr6u6vcpeu6z5f";
      try {
        // this sh

        final btcLnSubmarineSwap = await BtcLnSwap.newSubmarine(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );

        const expectedSecretKey =
            "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

        final swap = btcLnSubmarineSwap.btcLnSwap;
        print("SWAP CREATED SUCCESSFULLY: ${swap.id}");

        expect(swap.keys.secretKey, expectedSecretKey);

        print("PAYMENT DETAILS: ${swap.onchainAddress}:${swap.outAmount} sats");
      } catch (e) {
        print((e as bridge.BoltzError).kind);
        print((e as bridge.BoltzError).message);
      }
    });

    test('REVERSE SWAP', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Network.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const outAmount = 70000;
      try {
        // this should be a constructor newReverse on BtcLnSwap
        final btcLnSubmarineSwap = await BtcLnSwap.newReverse(
          mnemonic: mnemonic,
          index: index,
          outAmount: outAmount,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );
        const expectedSecretKey =
            "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";

        final swap = btcLnSubmarineSwap.btcLnSwap;
        print("SWAP CREATED SUCCESSFULLY: ${swap.id}");

        expect(swap.keys.secretKey, expectedSecretKey);

        print("PAYMENT DETAILS: ${swap.invoice}");
      } catch (e) {
        print(e);
        print((e as bridge.BoltzError).kind);
        print((e as bridge.BoltzError).message);
      }
    });
  });
}
