// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, avoid_unnecessary_containers

import 'package:e_commerce/controllers/sign_in_controller.dart';
import 'package:e_commerce/screens/auth_ui/sign_up_screen.dart';
import 'package:e_commerce/screens/user_panel/main_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/get_user_data_controller.dart';
import '../admin_panel/admin_main_screen.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
//import the SignInController from the sign_in_controller.dart
  final SignInController signInController = Get.put(SignInController());

  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
//create the textediting cotroller for textfields
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

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
              SizedBox(
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                    padding: const EdgeInsets.all(10.0),

                    //toggle eye button take the value of the controller and give it to obscuretext
                    child: Obx(
                      () => TextFormField(
                        controller: userPassword,
                        obscureText: signInController.isPassWordVisible.value,
                        cursorColor: AppConstant.appSecendoryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signInController.isPassWordVisible.toggle();
                              },
                              child: signInController.isPassWordVisible.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                    )),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          Get.offAll(() => ForgetPasswordScreen());
                        },
                        child: const Text('Forgot Password?'))
                  ],
                ),
              ),
              const SizedBox(),
              ElevatedButton(
                onPressed: () async {
                  //now had to pick the values of all controllers and save it in a string

                  String email = userEmail.text.trim();
                  String password = userPassword.text.trim();
                  //this values will show in else statement usercrdentialas

                  //now if the Email and password textfield is empty to show a snackbar to user

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar('Error', 'Enter your Email and Password');
                  } else {
                    //now take UserCredentials which can be empty (?) and save it in userCredentials

                    UserCredential? userCredential =
                        await signInController.signInMethod(email, password);

                    var userData = await getUserDataController
                        .getUserData(userCredential!.user!.uid);

                    //now if user credentials is not equal to null
                    if (userCredential != null) {
                      if (userCredential.user!.emailVerified) {
                        //logic for Admin Panel navigation
                        if (userData[0]['isAdmin'] == true) {
                          Get.snackbar(
                            'Success Admin login',
                            'Successfully Login ! ',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                          Get.offAll(() => AdminMainScreen());
                        } else {
                          Get.offAll(() => MainScreen());
                          Get.snackbar(
                            'Successfully User login',
                            'Successfully Login ! ',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecendoryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        }

                        //if everything okay from user side so they will moved to a screen below

                        //will add the logic in future for admin to navigates admin to admin dashboard and user to user
                      } else {
                        Get.snackbar(
                          'Error',
                          'Please Verify Your email before login ',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppConstant.appSecendoryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Error',
                        'Please Try Again !',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appSecendoryColor,
                        colorText: AppConstant.appTextColor,
                      );
                    }
                  }
                },
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
                  child: Row(
                    children: [
                      Text(
                        'Dont have an Account? ',
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
