import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_sign_in_controller.dart';
import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppConstant.appSecendoryColor,
        title: const Text(
          'W e l c o m e',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  child: Center(
                      child: Lottie.asset('assets/shopping_splash.json')),
                ),
              ),
              const Divider(),
              SizedBox(
                height: Get.height / 10,
              ),
              const Text(
                'Welcome Shopping ',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height / 8,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(() => const SignInScreen());
                },
                icon: const Icon(Icons.email),
                label: const Text('S i g n In With E m a i l'),
              ),
              SizedBox(
                height: Get.height / 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _googleSignInController.signInWithGoogle();
                },
                icon: const Icon(Icons.login_outlined),
                label: const Text('S i g n In With G o o g l e'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
