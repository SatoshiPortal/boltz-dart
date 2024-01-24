import 'package:boltz_dart/bridge_definitions.dart' as bridge;
import 'package:boltz_dart/root.dart';
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

void main() {
  test('FEE ESTIMATION', () async {
    const boltzUrl = 'https://api.testnet.boltz.exchange';
    final amount = 100000;
    final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);

    expect((fees.btcReverse.boltzFees > 0.0), true);
    expect((fees.btcSubmarine.boltzFees > 0.0), true);
  });

  group('BTC-LN SWAPS', () {
    test('SUBMARINE SWAP (SEND)', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Chain.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const invoice =
          "lntb30m1pj6uz4epp5e4gqhar3tfl307rygwh52xaxddp5fnjm3yqgvlh22hvulfwglv9sdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5gqxwczfrj58laly8rjapnhsxqs7zradeyquzk4pas2zcmhzt9r7qz45k6hwe8yr73r0gngzy8epqrlm9zejlaax7xlwcp36hj27ydrrqknna4lw7j3zsdzqy9cl8d4zhadnhnecccc28z8h59v83y20vaqcpy8x9zy";
      try {
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
        final paymentDetails = btcLnSubmarineSwap.paymentDetails();
        print("PAYMENT DETAILS: ${paymentDetails}");

        expect(swap.keys.secretKey, expectedSecretKey);

        print("PAYMENT DETAILS: ${swap.outAddress}:${swap.outAmount} sats");
      } catch (e) {
        print((e as bridge.BoltzError).kind);
        print((e as bridge.BoltzError).message);
      }
    });

    test('REVERSE SWAP (RECEIVE)', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Chain.Testnet;
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
        final paymentDetails = await btcLnSubmarineSwap.paymentDetails();

        print("PAYMENT DETAILS: ${paymentDetails}");
        print("PAY INVOICE WITHIN 30 seconds...");
        countdown(360);
        final status = await btcLnSubmarineSwap.status();
        print("STATUS: ${status}");
        final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: outAmount);
        final claimFeesEstimate = fees.btcReverse.claimFeesEstimate;
        print("CLAIM FEE ESTIMATE: $claimFeesEstimate");
        final txid = await btcLnSubmarineSwap.claim(absFee: claimFeesEstimate);
        print("TXID: $txid");
      } catch (e) {
        print(e);
        print((e as bridge.BoltzError).kind);
        print((e as bridge.BoltzError).message);
      }
    });
  });

  group('Lbtc-LN Swaps', () {
    test('SUBMARINE SWAP', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Chain.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const invoice =
          "lntb30m1pje68ahpp5jye9st2ajtl5ldsmspehmn803hj30mvh566mzw90zx9uewxx43cqdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5lqkdgaduy7qsrpe7edtrhadp4z4rm222hh90vt79j5uarnnfjnhs0hjalp2pnwg54pmm6hvqa8d4tmwcjdgjrm0sg58fj7xqm00hg6wqj069e9tmlj0r6kr8fqkt8qyhwr8ysdmwck86p8c6z4g0dr6u6vcpeu6z5f";
      try {
        final btcLnSubmarineSwap = await LbtcLnSwap.newSubmarine(
          mnemonic: mnemonic,
          index: index,
          invoice: invoice,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );

        const expectedSecretKey =
            "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";

        final swap = btcLnSubmarineSwap.lbtcLnSwap;
        print("SWAP CREATED SUCCESSFULLY: ${swap.id}");

        expect(swap.keys.secretKey, expectedSecretKey);

        print("PAYMENT DETAILS: ${swap.outAddress}:${swap.outAmount} sats");
      } catch (e) {
        print((e as bridge.BoltzError).kind);
        print((e as bridge.BoltzError).message);
      }
    });

    test('REVERSE SWAP', () async {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = bridge.Chain.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const outAmount = 70000;
      try {
        // this should be a constructor newReverse on BtcLnSwap
        final btcLnSubmarineSwap = await LbtcLnSwap.newReverse(
          mnemonic: mnemonic,
          index: index,
          outAmount: outAmount,
          network: network,
          electrumUrl: electrumUrl,
          boltzUrl: boltzUrl,
        );
        const expectedSecretKey =
            "a0a62dd7225288f41a741c293a3220035b4c71686dc34c01ec84cbe6ab11b4e1";

        final swap = btcLnSubmarineSwap.lbtcLnSwap;
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
