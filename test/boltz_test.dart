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
      const boltzUrl = 'api.testnet.boltz.exchange';
      // CHANGE ME PER TEST
      const invoice =
          "lntb30m1pjeemt8pp5y8efqxfpsktk3uksjnmkknp3ds25d8d58k9mla0d3mx53tzpyz3sdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp574hq3qaddyje5fd04e4hk4gz3zdhg3vqg03qk9u8nurrmnxmq7sskaw7ccr0z522urjs2mp6g0v0xlkenspj5yhlsadrlv9c32vrr8s5k4zuf4s465pvvns485z49lkkvr7cfacv0wnt5678uzr5qvr0mqgpp7u6cz";

      final btcLnSubmarineSwap = await ffi.newBtcLnSubmarineStaticMethodApi(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );
      const expectedSecret =
          '9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9';
      expect(btcLnSubmarineSwap.keys.secretKey, expectedSecret);
    });
  });
}
