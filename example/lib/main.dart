import 'package:boltz_dart/boltz_dart.dart';
import 'package:flutter/material.dart';

Future<String> fetchFees() async {
  try {
    const boltzUrl = 'https://api.testnet.boltz.exchange/v2';
    final fees = await const Fees(boltzUrl: boltzUrl).chain();
    print(fees);
    return fees.toString();
  } catch (e) {
    return 'Error fetching fees: $e';
  }
}

Future<void> main() async {
  await LibBoltz.init(); // Mandatory initialization

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boltz Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FeesScreen(),
    );
  }
}

class FeesScreen extends StatefulWidget {
  const FeesScreen({super.key});

  @override
  State<FeesScreen> createState() => _FeesScreenState();
}

class _FeesScreenState extends State<FeesScreen> {
  String _fees = 'Fetching fees...';

  @override
  void initState() {
    super.initState();
    _loadFees();
  }

  Future<void> _loadFees() async {
    _fees = await fetchFees();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Boltz Fees')),
      body: Center(child: Text(_fees)),
    );
  }
}
