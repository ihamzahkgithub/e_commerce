// ignore_for_file: avoid_print, non_constant_identifier_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
//RxList is GetX Controller List
  RxList<String> bannerUrls = RxList<String>([]);

  @override
  void onInit() {
    super.onInit();

    fetchBannersUrls();
  }

//function for fetching banners images from firebase
  Future<void> fetchBannersUrls() async {
    try {
      QuerySnapshot bannersSnapshot =
          await FirebaseFirestore.instance.collection('banners').get();

//condition

      if (bannersSnapshot.docs.isNotEmpty) {
        bannerUrls.value = bannersSnapshot.docs
            .map((doc) => doc['imageUrl'] as String)
            .toList();
      }
    } catch (e) {
      print('error : $e');
    }
  }
}
