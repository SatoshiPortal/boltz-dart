import 'package:boltz_dart/boltz_dart.dart';

void main() async {
  const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
  final amount = 100000;
  final fees = await Fees(boltzUrl: boltzUrl);
  print('FEES:${fees}');
}
