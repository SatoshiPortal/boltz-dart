import 'dart:ffi';
import 'dart:io' show Platform;

import 'bridge_generated.dart';

export 'bridge_definitions.dart';
export 'bridge_generated.dart';

final _api = DynamicLibrary.open(
  './test/libboltz_dart.${Platform.operatingSystem == 'linux' ? '.so' : 'dylib'}',
);
final ffi = BoltzDartImpl(_api);


// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 

// const _libName = 'boltz';

/// Use for Darwin framework lookup.
/// Use an explicit package constant to avoid
/// if the library name and the package name are not the same.
/// The value must be equal to the package name defined in pubspec.yaml.
// const _package = 'native';

// final _dylib = switch (Platform.operatingSystem) {
//   'ios' || 'macos' => '$_package.framework/$_package',
//   'android' || 'linux' => 'lib$_libName.so',
//   'windows' => '$_libName.dll',
//   _ => throw UnsupportedError(
//       'unsupported operating system ${Platform.operatingSystem}',
//     ),
// };

// DynamicLibrary getBinary() {
//   if (Platform.environment['FLUTTER_TEST'] == 'true') {
//     try {
//       DynamicLibrary.open(_dylib);
//     } catch (e) {
//       throw Exception("Unable to open the dylib! Try calling setCurrentDirectory()");
//     }
//   }
//   if (Platform.isIOS || Platform.isMacOS) {
//     return DynamicLibrary.executable();
//   } else if (Platform.isAndroid) {
//     return DynamicLibrary.open("librust_bdk_ffi.so");
//   } else {
//     throw Exception("not support platform:${Platform.operatingSystem}");
//   }
// }

// final Native api = NativeImpl(_open());
// final api = DynamicLibrary.open('./test/libboltz_dart.dylib');
// final apiLinux = DynamicLibrary.open('./test/libboltz_dart.so');
