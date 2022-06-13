import 'package:flutter/material.dart';
import 'package:tubes_abp_flutter/WelcomeScreen/welcome.dart';

void main() {
  runApp(const GoWis());
}

class GoWis extends StatelessWidget {
  const GoWis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
