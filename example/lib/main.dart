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
    // const amount = 100000;
    final fees = await const bltz.Fees(boltzUrl: boltzUrl).chain();
    print('FEES:${fees}');
  } catch (e) {
    print('\n\nERRRR: ' + e.toString() + '\n\n');
  }
}
