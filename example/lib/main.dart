import 'package:boltz_dart/boltz_dart.dart';
import 'dart:ffi'; // For FFI-related classes like DynamicLibrary, Pointer, and Utf8
import 'package:ffi/ffi.dart'; // For Utf8 string handling and converting between Dart and C strings
import 'dart:io';
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';

void main() async {
  await LibBoltz.init();
  const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
  final amount = 100000;
  final fees = await Fees(boltzUrl: boltzUrl);
  print('FEES:${fees}');
}
