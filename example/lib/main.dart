// import 'package:boltz_dart/boltz_dart.dart';
// import 'dart:ffi'; // For FFI-related classes like DynamicLibrary, Pointer, and Utf8
// import 'package:ffi/ffi.dart'; // For Utf8 string handling and converting between Dart and C strings
// import 'dart:io';
// import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

// final DynamicLibrary _objcLib = DynamicLibrary.process();

// class NSBundleHelper {
//   static final Pointer<Utf8> Function() _getMainBundlePath = _objcLib
//       .lookup<NativeFunction<Pointer<Utf8> Function()>>('getMainBundlePath')
//       .asFunction();

//   static String get mainBundlePath => _getMainBundlePath().toDartString();
// }

// void main() async {
//   final String projectDir = Directory.current.path;
//   await BoltzCore.init(
//     externalLibrary: ExternalLibrary.open(
//       'build/ios/boltz_dart/boltz_dart.framework/boltz_dart',
//     ),
//   );
//   const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
//   final amount = 100000;
//   final fees = await Fees(boltzUrl: boltzUrl);
//   print('FEES:${fees}');
// }

import 'package:boltz_dart/boltz_dart.dart' as bltz;
import 'package:flutter/material.dart';

void main() async {
  await test();
  runApp(MaterialApp(home: Scaffold(body: Container(color: Colors.red))));
}

Future test() async {
  try {
    await bltz.LibBoltz.init();
    const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
    const amount = 100000;
    final fees = await const bltz.Fees(boltzUrl: boltzUrl).chain();
    print('FEES:${fees}');
  } catch (e) {
    print('\n\nERRRR: ' + e.toString() + '\n\n');
  }
}
