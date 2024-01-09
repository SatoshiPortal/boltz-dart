import 'package:boltz_dart/ffi.dart';
import 'package:test/test.dart';

void main() {
  group('BTC-LN SWAPS', () {
    test('FEE ESTIMATION', () async {
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      final fees = await ffi.swapFeesStaticMethodApi(boltzUrl: boltzUrl);
      print(
          "USER MUST ACCEPT FEE TO PROCEED:\nbtc: ${fees.$1} sats/byte\nlbtc: ${fees.$2} sats/byte");
      expect((fees.$1 > 0.0), true);
      expect((fees.$2 > 0.0), true);
    });
  });
}
