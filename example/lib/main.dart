import 'package:boltz_dart/boltz_dart.dart';

void main() async {
  const boltzUrl = 'https://api.testnet.boltz.exchange';
  final amount = 100000;
  final fees = await AllSwapFees.estimateFee(boltzUrl: boltzUrl, outputAmount: amount);
  print('FEES:${fees.lbtcSubmarine.lockupFeesEstimate}');
}
