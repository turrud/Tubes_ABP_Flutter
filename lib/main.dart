import 'package:flutter/material.dart';
import 'package:tubes_abp_flutter/WelcomeScreen/welcome.dart';

void main() {
  runApp(const GoWis());
}

class GoWis extends StatelessWidget {
  const GoWis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      title: 'Go Wis',
      //import theme from theme data

      home: const WelcomeScreen(),
    );
  }
}
