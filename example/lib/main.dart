import 'package:boltz_dart/boltz_dart.dart';
import 'dart:ffi'; // For FFI-related classes like DynamicLibrary, Pointer, and Utf8
import 'package:ffi/ffi.dart'; // For Utf8 string handling and converting between Dart and C strings
import 'dart:io';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

final DynamicLibrary _objcLib = DynamicLibrary.process();

class NSBundleHelper {
  static final Pointer<Utf8> Function() _getMainBundlePath = _objcLib
      .lookup<NativeFunction<Pointer<Utf8> Function()>>('getMainBundlePath')
      .asFunction();

  static String get mainBundlePath => _getMainBundlePath().toDartString();
}

void main() async {
  final String projectDir = Directory.current.path;
  await BoltzCore.init(
    externalLibrary: ExternalLibrary.open(
      'build/ios/boltz_dart/boltz_dart.framework/boltz_dart',
    ),
  );
  const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
  final amount = 100000;
  final fees = await Fees(boltzUrl: boltzUrl);
  print('FEES:${fees}');
}
