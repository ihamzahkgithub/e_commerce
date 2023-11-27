import 'package:e_commerce/screens/auth_ui/welcome_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20.0,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            AppConstant.appMainName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppConstant.appTextColor),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () async {
                //logic for logout
                GoogleSignIn googleSignIn = GoogleSignIn();

                await googleSignIn.signOut();
                Get.offAll(() => WelcomeScreen());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              ),
            )
          ],
        ),
      ),
    );
  }
}
