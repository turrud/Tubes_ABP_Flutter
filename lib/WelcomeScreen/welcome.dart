import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tubes_abp_flutter/home/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Go Wis",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: -0.6,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(248, 180, 228, 8))),
              const Text(
                "Welcome to Go Wis with us...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "arial",
                  color: Color.fromARGB(255, 121, 119, 119),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Lottie.asset(
                "assets/animation/123-go.json",
                height: 350,
                width: double.infinity,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text("",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 121, 119, 119))),
              const SizedBox(
                height: 45,
              ),
              const Text(" Let's Go",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto",
                      color: Color.fromARGB(255, 121, 119, 119))),
              const SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                backgroundColor: const Color.fromARGB(248, 5, 190, 144),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()));
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
