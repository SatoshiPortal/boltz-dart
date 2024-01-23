import 'package:boltz_dart/http.dart';
import 'package:test/test.dart';

void main() {
  test('Version', () async {
    final api = await BoltzApi.newBoltzApi();
    final version = await api.getBackendVersion();

    expect(version, startsWith('3.4.0'));
  });

  test('Get pairs', () async {
    final api = await BoltzApi.newBoltzApi();
    final pairs = await api.getSupportedPairs();
    // print(pairs);

    expect(pairs.length, equals(3));
  });
}
