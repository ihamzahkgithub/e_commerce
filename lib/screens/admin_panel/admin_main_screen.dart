import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_drawer_widget.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppConstant.appTextColor),
        backgroundColor: Colors.red,
        title: const Text(
          'Admin Main Screen',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
    );
  }
}
