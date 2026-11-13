import 'package:flutter_test/flutter_test.dart';
import 'package:boltz/src/utils/loader.dart';

void main() {
  test('loads the default Native Assets library without an override', () async {
    await LibBoltz.init();
  });
}
