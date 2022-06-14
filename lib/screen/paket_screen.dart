import 'package:flutter/material.dart';

class PaketScreen extends StatefulWidget {
  const PaketScreen({Key? key}) : super(key: key);

  @override
  State<PaketScreen> createState() => _PaketScreenState();
}

class _PaketScreenState extends State<PaketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('paket')),
      body: const Center(
        child: Text('pakettt'),
      ),
    );
  }
}
