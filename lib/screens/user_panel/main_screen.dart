// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:e_commerce/screens/auth_ui/sign_in_screen.dart';
import 'package:e_commerce/widgets/banner_widget.dart';
import 'package:e_commerce/widgets/heading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../widgets/custom_drawer_widget.dart';

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
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        elevation: 20.0,
        backgroundColor: Colors.redAccent,
        title: Text(
          AppConstant.appMainName,
          style: const TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      //custom drawer widget
      drawer: const DrawerWidget(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 90.0,
            ),

            //banner widget

            const BannerWidget(),

            //Heading Widget.dart

            HeadingWidget(
              //required parameters filled
              headingTitle: 'Categories',
              headingSubtile: 'As Per You Budget',
              onTap: () {},
              buttonText: 'See More >',
            ),

            HeadingWidget(
              headingTitle: 'SubCategories',
              headingSubtile: 'Acc to your Budget',
              onTap: () {},
              buttonText: 'See More >',
            ),
          ],
        ),
      ),
    );
  }
}
