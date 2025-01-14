import 'package:boltz/boltz.dart';
import 'package:flutter/material.dart';

void main() async {
  await LibBoltz.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Fees Display')),
        body: const FeesWidget(),
      ),
    );
  }
}

class FeesWidget extends StatelessWidget {
  const FeesWidget({Key? key}) : super(key: key);

  Future<String> fetchFees() async {
    const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
    try {
      final fees = await const Fees(boltzUrl: boltzUrl).chain();
      return fees.toString();
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchFees(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Failed to load fees.'));
        } else {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Text(snapshot.data!, style: const TextStyle(fontSize: 16)),
          );
        }
      },
    );
  }
}
