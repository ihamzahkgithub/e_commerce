import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Add a delay of three seconds and navigate to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/shopping_splash.json"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              "Powered By Hamza ",
              style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
