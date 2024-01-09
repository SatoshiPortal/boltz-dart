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

  group('BTC SUBMARINE SWAP', () {
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
          "lntb30m1pje6zytpp50y00jtjamj078tvw88juck6trs5wwrca4ajsuqxsmt6radmn869qdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5tmdqqgrgl4l0d59nz5jpfh0lnmcy8dtfsv558scgwcfags0mpjrqlmt4zmyq3ncsle4ppxefu4u33sgu56snm2clsuhn8q8ggqm5t0f8344gpy8drnfh4pqfucaaqnze4f44scjz0yda3st7rnhpjz69yasq46nvp3";
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
