import 'package:flutter/material.dart';
import 'package:tubes_abp_flutter/WelcomeScreen/welcome.dart';
// import 'package:tubes_abp_flutter/widgets/bottom_navigation_bar.dart';
// import 'package:tubes_abp_flutter/screen/home_screen.dart';

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
