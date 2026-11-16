import 'dart:convert';
import 'dart:io';

import 'package:boltz/boltz.dart' as boltz;
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUpAll(() => boltz.LibBoltz.init());
  tearDownAll(boltz.BoltzCore.dispose);

  test(
    'native profile preserves an explicitly selected host through FRB',
    () async {
      final profile = await boltz.RegtestNetworkProfile.forHost(
        host: 'regtest.example',
      );
      expect(profile.host, 'regtest.example');
      expect(profile.boltzUrl, 'http://regtest.example:9001/v2');
      expect(profile.btcExplorerUrl, 'http://regtest.example:3000');
      expect(profile.lbtcExplorerUrl, 'http://regtest.example:3001');
      for (final chain in [
        boltz.Chain.bitcoinRegtest,
        boltz.Chain.liquidRegtest,
      ]) {
        final settings = await profile.electrumSettings(chain: chain);
        expect(settings.tls, isFalse);
        expect(settings.validateDomain, isFalse);
      }
      final quotes = await boltz.Fees.forRegtest(profile: profile);
      expect(quotes.regtestProfile, profile);
    },
  );

  test('mainnet and testnet JSON retain the exact ce7 wire format', () async {
    for (final network in ['mainnet', 'testnet']) {
      final original = File('rust/tests/fixtures/chain_swap_$network.json')
          .readAsStringSync();
      final swap = await boltz.ChainSwap.fromJson(jsonStr: original);
      final encoded = await swap.toJson();
      expect(encoded, original);
      expect(jsonDecode(encoded)['is_testnet'], network == 'testnet');
    }
  });

  test(
    'regtest JSON and its profile survive native hydration and rewriting',
    () async {
      final profile = await boltz.RegtestNetworkProfile.forHost(
        host: 'regtest.example',
      );
      final blob = jsonDecode(
        File('rust/tests/fixtures/chain_swap_mainnet.json').readAsStringSync(),
      ) as Map<String, dynamic>;
      blob.remove('is_testnet');
      blob['network'] = 'Regtest';
      blob['boltz_url'] = profile.boltzUrl;
      blob['btc_electrum_url'] = profile.btcElectrumUrl;
      blob['lbtc_electrum_url'] = profile.lbtcElectrumUrl;
      blob['regtest_profile'] = {
        'host': profile.host,
        'boltz_url': profile.boltzUrl,
        'btc_electrum_url': profile.btcElectrumUrl,
        'lbtc_electrum_url': profile.lbtcElectrumUrl,
        'btc_explorer_url': profile.btcExplorerUrl,
        'lbtc_explorer_url': profile.lbtcExplorerUrl,
      };
      final swap = await boltz.ChainSwap.fromJson(jsonStr: jsonEncode(blob));
      expect(swap.network, boltz.Network.regtest);
      expect(swap.regtestProfile, profile);
      final encoded = await swap.toJson();
      final restored = await boltz.ChainSwap.fromJson(jsonStr: encoded);
      expect(restored.regtestProfile, profile);
      final rewritten = jsonDecode(encoded) as Map<String, dynamic>;
      expect(rewritten.containsKey('is_testnet'), isFalse);
      expect(rewritten['network'], 'Regtest');
      expect(rewritten['regtest_profile']['host'], profile.host);
    },
  );

  test('native rejects duplicate network fields across the bridge', () async {
    final blob = File('rust/tests/fixtures/chain_swap_mainnet.json')
        .readAsStringSync()
        .replaceFirst(
          '"is_testnet":false',
          '"is_testnet":false,"is_testnet":false',
        );
    await expectLater(
      boltz.ChainSwap.fromJson(jsonStr: blob),
      throwsA(isA<boltz.BoltzError>()),
    );
  });

  test('concrete regtest chain rejects a testnet key before IO', () async {
    final profile = await boltz.RegtestNetworkProfile.localhost();
    final key = boltz.SwapMasterKey(
      xprv: '',
      xpub: '',
      mnemonic: '',
      fingerprint: '',
      network: boltz.Network.testnet,
    );
    await expectLater(
      boltz.BtcLnSwap.newSubmarine(
        swapMasterKey: key,
        index: BigInt.zero,
        invoice: '',
        network: boltz.Chain.bitcoinRegtest,
        electrumUrl: profile.btcElectrumUrl,
        boltzUrl: profile.boltzUrl,
        regtestProfile: profile,
      ),
      throwsA(
        isA<boltz.BoltzError>().having(
          (error) => error.kind,
          'kind',
          'Network',
        ),
      ),
    );
  });
}
