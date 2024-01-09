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
          "lntb30m1pje68vcpp5nfttynznk9cmvqy08kl5s8zwzm0jw27yjfnah8keejyrn04ptrfsdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5tvlr5050qsx0z8v028eugl4xsa0qevcykvez562vwl7rsha4shes7qpvf3ntayzh5ppaex2cu5j5jvemjxwc4kv0tufqkll8hxd7q34ptl79y0t203kgw5jqek5pwv03dchhplaullatavwxrxfypyjvrzqq64katd";
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
        print(
            "PAYMENT DETAILS: ${btcLnSubmarineSwap.onchainAddress}:${btcLnSubmarineSwap.outAmount} sats");
        expect(btcLnSubmarineSwap.keys.secretKey, expectedSecretKey);
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
