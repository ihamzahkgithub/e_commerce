// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:e_commerce/screens/auth_ui/sign_up_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appSecendoryColor,
          automaticallyImplyLeading: false,
          title: const Text(
            'S i g n I n',
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
                      'Welcome to My APP',
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.appSecendoryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: Icon(Icons.visibility_off),
                        contentPadding:
                            const EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                  ),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text('Forgot Password?'))
                  ],
                ),
              ),
              const SizedBox(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'S I G N  I N',
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
              GestureDetector(
                onTap: () {
                  Get.offAll(SignUpScreen());
                  //navigation to Sign Up Page
                },
                child: const Card(
                    margin: EdgeInsetsDirectional.all(12),
                    color: Colors.blue,
                    child: Text(
                      'Dont have an Account? Sign Up',
                      style: TextStyle(color: AppConstant.appTextColor),
                    )),
              )
            ],
          ),
        ),
      );
    });
  }
}
