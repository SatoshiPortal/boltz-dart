import 'dart:io';

import 'package:archive/archive.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:flutter_rust_bridge/flutter_rust_bridge_for_generated.dart';
import 'package:http/http.dart' as http;

import '../generated/frb_generated.dart';

const name = "libboltz";
const iosName = "boltz";

class Dylib {
  static Map<String, dynamic>? _config;
  static String get libName => "unittest.libboltz.${_config!['TAG_VERSION']}";
  static String get remoteUrl =>
      "${_config!['REPOSITORY_URL']}${_config!['TAG_VERSION']}/$libName.zip";
  static Future<void> _loadJsonAsset() async {
    final String content =
        await rootBundle.loadString("packages/boltz/assets/release.config.txt");
    Map<String, dynamic> configMap = {};
    List<String> lines = content.split('\n');

    for (String line in lines) {
      List<String> keyVal = line.split('=');
      if (keyVal.length == 2) {
        String key = keyVal[0].trim();
        dynamic value = keyVal[1].trim();
        configMap[key] = value;
      }
    }
    _config = configMap;
  }

  static Future<void> downloadUnitTestDylib(String currentDirectory) async {
    await _loadJsonAsset();
    final assetsDir = '$currentDirectory/build/unit_test_assets/$libName';
    if (!(await Directory('$assetsDir/$libName').exists())) {
      try {
        final response = await http.get(Uri.parse(remoteUrl));
        if (response.statusCode == 200) {
          final bytes = response.bodyBytes;
          final archive = ZipDecoder().decodeBytes(Uint8List.fromList(bytes));
          for (final file in archive) {
            final filename = '$assetsDir/${file.name}';
            if (file.isFile) {
              final fileContent = await File(filename).create(recursive: true);
              await fileContent.writeAsBytes(file.content);
            } else {
              await Directory(filename).create(recursive: true);
            }
          }
        } else {
          print('Download failed: status code ${response.statusCode}!');
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  static String get _dylibFileName {
    if (Platform.isMacOS) {
      return "$name.dylib";
    } else if (Platform.isLinux) {
      return "$name.so";
    } else {
      throw Exception("not support platform:${Platform.operatingSystem}");
    }
  }

  static ExternalLibrary getDylib() {
    if (Platform.environment['FLUTTER_TEST'] == 'true') {
      // `flutter test` regenerates build/unit_test_assets on every fresh
      // build, wiping anything staged there beforehand — so also accept the
      // lib straight from cargo's target directory.
      final root = Directory.current.path;
      final candidates = [
        '$root/build/unit_test_assets/$_dylibFileName',
        '$root/rust/target/release/$_dylibFileName',
        '$root/rust/target/debug/$_dylibFileName',
      ];
      for (final path in candidates) {
        if (File(path).existsSync()) {
          return ExternalLibrary.open(path);
        }
      }
      throw Exception(
          "Unable to find the unit test dylib; tried: ${candidates.join(', ')}");
    }
    if (Platform.isIOS || Platform.isMacOS) {
      return ExternalLibrary.open("$iosName.framework/$iosName");
    } else if (Platform.isAndroid) {
      return ExternalLibrary.open("$name.so");
    } else if (Platform.isLinux) {
      return ExternalLibrary.open("$name.so");
    } else {
      throw Exception("not support platform:${Platform.operatingSystem}");
    }
  }
}

class LibBoltz {
  static Future<void> init() async {
    try {
      if (!BoltzCore.instance.initialized) {
        await BoltzCore.init(externalLibrary: Dylib.getDylib());
      }
    } catch (e) {
      // print(e);
      throw Exception("Failed to initialize boltz-client: $e");
    }
  }
}
