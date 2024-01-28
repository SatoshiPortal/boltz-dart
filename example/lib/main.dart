import 'package:boltz_dart/boltz_dart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    runFFI();
  }

  void runFFI() async {
    try {
      const mnemonic =
          'bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon bacon';
      const index = 0;
      const network = Chain.Testnet;
      const electrumUrl = 'electrum.bullbitcoin.com:60002';
      const boltzUrl = 'https://api.testnet.boltz.exchange';

      const invoice =
          "lntb30m1pj6uz4epp5e4gqhar3tfl307rygwh52xaxddp5fnjm3yqgvlh22hvulfwglv9sdpyxysysctvvcsxzgz5dahzqmmxyppk7enxv4jsxqrrsscqp79qy9qsqsp5gqxwczfrj58laly8rjapnhsxqs7zradeyquzk4pas2zcmhzt9r7qz45k6hwe8yr73r0gngzy8epqrlm9zejlaax7xlwcp36hj27ydrrqknna4lw7j3zsdzqy9cl8d4zhadnhnecccc28z8h59v83y20vaqcpy8x9zy";

      final btcLnSubmarineSwap = await BtcLnSwap.newSubmarine(
        mnemonic: mnemonic,
        index: index,
        invoice: invoice,
        network: network,
        electrumUrl: electrumUrl,
        boltzUrl: boltzUrl,
      );
      const expectedSecretKey = "9b496356fbb59d95656acc879a5d7a9169eb3d77e5b7c511aeb827925e5b49e9";
      final swap = btcLnSubmarineSwap.btcLnSwap;
      print("SWAP CREATED SUCCESSFULLY: ${swap.id}");
      final paymentDetails = btcLnSubmarineSwap.paymentDetails();
      print("PAYMENT DETAILS: ${paymentDetails}");
    } catch (e) {
      print('err');
    }
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 25);
    const spacerSmall = SizedBox(height: 10);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Native Packages'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  'This calls a native function through FFI that is shipped as source in the package. '
                  'The native code is built as part of the Flutter Runner build.',
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
                spacerSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
