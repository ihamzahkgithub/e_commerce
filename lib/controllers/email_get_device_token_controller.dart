// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import '../utils/app_constants.dart';

class EmailGetDeviceTokenController extends GetxController {
  String? emailDeviceToken;

  @override
  void onInit() {
    super.onInit();

    emailGetDeviceToken();
  }

  Future<void> emailGetDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null) {
        emailDeviceToken = token;

        print("token : $emailDeviceToken");

        update();
      }
    } catch (e) {
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
