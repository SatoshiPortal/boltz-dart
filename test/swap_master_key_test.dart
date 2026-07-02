import 'package:boltz/boltz.dart';
import 'package:test/test.dart';

import 'test_data.dart';

void main() {
  setUp(() async => await LibBoltz.init());

  const walletMnemonic =
      'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon '
      'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';

  const expectedSwapMnemonic =
      'velvet engage shaft effort clarify annual protect client only surround '
      'sock gain';
  const expectedXprv =
      'xprvA2Cw2wgWLdz9ppAYGVYpfVT6zjdVpQg9MPh9vuFQj3CMDguEv1reAdHiaSPyjqmk7sb7BA9X8T29snJGMtLBWKmATtdPaQijCbc5bbViDsH';
  const expectedXpub =
      'xpub6FCHSTDQB1YT3JF1NX5q2dPqYmTzDsPzicckjHf2HNjL6VEPTZAtiRcCRixiSpfKinRfWGFQ5b1yw74jzsBd1hkm25864ZpH8uND7rjKjiV';

  group('SwapMasterKey.create — mainnet known vector', () {
    test('derives the documented swap mnemonic, xprv and xpub', () async {
      final key = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );

      expect(key.mnemonic, expectedSwapMnemonic);
      expect(key.xprv, expectedXprv);
      expect(key.xpub, expectedXpub);
      expect(key.network, Network.mainnet);
      expect(key.fingerprint, isNotEmpty);
    });
  });

  group('SwapMasterKey.create — invariants', () {
    test('is deterministic for the same inputs', () async {
      final a = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      final b = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      expect(a, b);
    });

    test('a passphrase changes the derived keys', () async {
      final noPass = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      final withPass = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: 'a-passphrase',
        network: Network.mainnet,
      );
      expect(withPass.xprv, isNot(noPass.xprv));
      expect(withPass.mnemonic, isNot(noPass.mnemonic));
    });

    test('the network changes the derived keys', () async {
      final mainnet = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      final testnet = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.testnet,
      );
      expect(testnet.xprv, isNot(mainnet.xprv));
      expect(testnet.xpub, isNot(mainnet.xpub));
    });

    test('a different wallet mnemonic yields a different swap mnemonic',
        () async {
      const otherMnemonic =
          'abandon abandon abandon abandon abandon abandon abandon abandon '
          'abandon abandon abandon about';
      final a = await SwapMasterKey.create(
        walletMnemonic: walletMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      final b = await SwapMasterKey.create(
        walletMnemonic: otherMnemonic,
        walletPassphrase: null,
        network: Network.mainnet,
      );
      expect(b.mnemonic, isNot(a.mnemonic));
      expect(b.xprv, isNot(a.xprv));
    });
  });

  group('PreImage.fromInvoiceStr', () {
    test('extracts a hash-only preimage (no secret bytes)', () async {
      final preimage = await PreImage.fromInvoiceStr(invoice: invoice123);

      expect(preimage.value, isEmpty);
      expect(preimage.sha256, hasLength(64));
      expect(preimage.hash160, hasLength(40));
      expect(RegExp(r'^[0-9a-f]+$').hasMatch(preimage.sha256), isTrue);
    });

    test('is deterministic for the same invoice', () async {
      final a = await PreImage.fromInvoiceStr(invoice: invoice123);
      final b = await PreImage.fromInvoiceStr(invoice: invoice123);
      expect(a.sha256, b.sha256);
      expect(a.hash160, b.hash160);
    });

    test('throws on an invalid invoice instead of panicking', () async {
      await expectLater(
        PreImage.fromInvoiceStr(invoice: invalidInvoice),
        throwsA(anything),
      );
    });
  });
}
