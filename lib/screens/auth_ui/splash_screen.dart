import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/get_user_data_controller.dart';
import '../admin_panel/admin_main_screen.dart';
import '../user_panel/main_screen.dart';
import 'welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//current logged in user
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();

    // Add a delay of three seconds and navigate to the next screen
    Future.delayed(const Duration(seconds: 3), () {
//call this loggedin function in this delay
      loggedin(context);
      Get.to(WelcomeScreen());
    });
  }

// this function will keep the user logged in from firebase like state of the user wil be saved
  Future<void> loggedin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if (userData[0]['isAdmin'] == true) {
        Get.offAll(() => const AdminMainScreen());
      } else {
        Get.offAll(() => const MainScreen());
      }
    } else {
      Get.to(() => WelcomeScreen());
    }
  }

//above is the logic for keeping the user logged in
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset("assets/shopping_splash.json"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              height: 300.0,
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
