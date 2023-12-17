// ignore_for_file: sort_child_properties_last, prefer_const_constructors, sized_box_for_whitespace

import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
//import the forgetPasswordController from the forget_password_controller.dart
  final ForgetPasswordController forgetPasswordController =
      Get.put(ForgetPasswordController());
//create the textediting cotroller for textfields
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecendoryColor,
          automaticallyImplyLeading: true,
          title: const Text(
            'Forget Password',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: AppConstant.appTextColor),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              isKeyboardVisible
                  ? const SizedBox(
                      height: 5.0,
                    )
                  : const Text(
                      'Reset Your  Password',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              const SizedBox(),
              Container(
                width: 200.0,
                height: 200.0,
                child: Lottie.asset('assets/shopping_splash.json'),
              ),
              SizedBox(
                height: Get.height / 30,
              ),
              const SizedBox(
                height: 12.0,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstant.appSecendoryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          prefixIcon: const Icon(Icons.email),
                          contentPadding:
                              const EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
              const SizedBox(
                height: 8.0,
              ),
              const SizedBox(
                height: 5.0,
              ),
              const SizedBox(),
              ElevatedButton(
                onPressed: () async {
                  //now had to pick the values of all controllers and save it in a string

                  String email = userEmail.text.trim();

                  //this values will show in else statement usercrdentialas

                  //now if the Email and password textfield is empty to show a snackbar to user

                  if (email.isEmpty) {
                    Get.snackbar('Error', 'Enter your Email and Password');
                  } else {
                    String email = userEmail.text.trim();
                    forgetPasswordController.ForgetPasswordMethod(email);
                  }
                },
                child: Text(
                  'Forget Password',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(AppConstant
                      .appSecendoryColor), // Change the background color
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(
                        horizontal: 50.0, vertical: 12.0),
                  ), // Adjust padding
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Adjust border radius
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      );
    });
  }
}
