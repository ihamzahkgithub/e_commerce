// ignore_for_file: body_might_complete_normally_nullable, unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for Password Visibility eye icon in password textfield
  var isPassWordVisible = false.obs;
//have signed in user
  Future<UserCredential?> signInMethod(
    String userEmail,
    String userPassword,
  ) async {
    try {
      //easyloading start
      EasyLoading.show(status: "Wait a sec..");

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      //easyloading end
      EasyLoading.dismiss();
      return userCredential;

      //return user credentials
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();

      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appSecendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}
