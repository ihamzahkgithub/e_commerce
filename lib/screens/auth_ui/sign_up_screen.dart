// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:e_commerce/controllers/sign_up_controller.dart';
import 'package:e_commerce/screens/auth_ui/sign_in_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //import the sign up controller

  final SignUpController signUpController = Get.put(SignUpController());
  //create a text eding controllers for each textField

  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecendoryColor,
        automaticallyImplyLeading: false,
        title: const Text(
          'S i g n Up',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            const Text(
              'Welcome to My APP',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
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
                    //textediting controller
                    controller: userName,
                    cursorColor: AppConstant.appSecendoryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'UserName',
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
                  child: TextFormField(
                    controller: userPhone,
                    cursorColor: AppConstant.appSecendoryColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        prefixIcon: const Icon(Icons.phone),
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
                    controller: userCity,
                    cursorColor: AppConstant.appSecendoryColor,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        hintText: 'City',
                        prefixIcon: const Icon(Icons.location_city),
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

                  //add your textformfield in obx which is get statememt for toggle visbility eye button
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,

                      //logic for visibility eye icon which value is imported from signup controller.dart

                      obscureText: signUpController.isPassWordVisible.value,

                      cursorColor: AppConstant.appSecendoryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                signUpController.isPassWordVisible.toggle();
                              },
                              child: signUpController.isPassWordVisible.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          contentPadding:
                              const EdgeInsets.only(top: 2.0, left: 8.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  )),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () async {
                String name = userName.text.trim();
                String email = userEmail.text.trim();
                String phone = userPhone.text.trim();
                String city = userCity.text.trim();
                String password = userPassword.text.trim();
                String userDeviceToken = '';
                //suitble for notification purpose from firebase

                if (name.isEmpty ||
                    email.isEmpty ||
                    phone.isEmpty ||
                    city.isEmpty ||
                    password.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Pls Enter all details ",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppConstant.appMainColor,
                    colorText: AppConstant.appTextColor,
                  );
                } else {
                  UserCredential? userCredential =
                      await signUpController.signUpMethod(
                    name,
                    email,
                    phone,
                    city,
                    password,
                    userDeviceToken,
                  );

                  if (userCredential != null) {
                    Get.snackbar(
                      "Verifiction Email Sent ",
                      "Pls Check you email ",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appMainColor,
                      colorText: AppConstant.appTextColor,
                    );

                    FirebaseAuth.instance.signOut();
                    Get.offAll(() => SignInScreen());
                  }
                }
              },
              child: Text(
                'S I G N  U P',
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
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
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
                Get.offAll(SignInScreen());
                //navigation to Sign In Page
              },
              child: const Card(
                  margin: EdgeInsetsDirectional.all(12),
                  color: Colors.blue,
                  child: Text(
                    'Already have an Account? Sign In',
                    style: TextStyle(color: AppConstant.appTextColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
