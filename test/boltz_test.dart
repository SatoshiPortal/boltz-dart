// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
import '../lib/bridge_generated.dart';
import '../lib/ffi.dart';
import 'package:test/test.dart';

void main() {
  // Your tests go here.
  test('Test KeyPair', () async {
    final mnemonic =
        'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';

    final ffi = BoltzDartImpl(api);
    const swapType = BoltzSwapType.Submarine;
    final keyPair = await ffi.keypairFromMnemonicStaticMethodApi(
      mnemonic: mnemonic,
      index: 0,
      swapType: swapType,
    );
    const expectedSecret = '9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9';
    expect(keyPair.secretKey, expectedSecret);
  });
}
