import 'package:flutter/material.dart';

class RentScreen extends StatefulWidget {
  const RentScreen({Key? key}) : super(key: key);

  @override
  State<RentScreen> createState() => _RentScreenState();
}

class _RentScreenState extends State<RentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Rental'),
            Text(' '),
            Text('GoWis', style: TextStyle(color: Colors.blue))
          ],
        ),
        elevation: 1.0,
      ),
      body: const Center(
        child: Text('rentall'),
      ),
    );
  }
}
