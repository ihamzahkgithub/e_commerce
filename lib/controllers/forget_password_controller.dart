import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/screens/auth_ui/sign_in_screen.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//have signed in user
  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      //easyloading start
      EasyLoading.show(status: "Wait a sec..");
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request Sent Successfully !",
        "Password Reset Sent To $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appSecendoryColor,
        colorText: AppConstant.appTextColor,
      );
      //will move to sign in screen when click on forget password btn
      Get.offAll(() => SignInScreen());
      //easyloading end
      EasyLoading.dismiss();

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
