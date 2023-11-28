// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:e_commerce/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for Password Visibility eye icon in password textfield
  var isPassWordVisible = false.obs;
//have signed in user
  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      //easyloading start
      EasyLoading.show(status: "Wait a sec..");

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      //will send an email c=verification to user
      await userCredential.user!.sendEmailVerification();

      //have created a user model in models.dart
      //the user detail are stored in userCredential so will store in  it

      UserModel userModel = UserModel(
        //uId is the user collection doc Id (userCredential.user!.uid)
        uId: userCredential.user!.uid,
        username: userName,
        email: userEmail,
        phone: userPhone,
        userImg: '',
        userDeviceToken: userDeviceToken,
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: userCity,
      );

      //now wil store that user userModel Data in Firestore firebase

      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
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
