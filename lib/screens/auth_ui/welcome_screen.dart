import 'package:e_commerce/screens/auth_ui/sign_in_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
              Divider(),
              SizedBox(
                height: Get.height / 10,
              ),
              const Text(
                'Welcome Shopping ',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height / 8,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.email),
                label: const Text('S i g n In With E m a i l'),
              ),
              SizedBox(
                height: Get.height / 25,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Get.to(SignInScreen());
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
