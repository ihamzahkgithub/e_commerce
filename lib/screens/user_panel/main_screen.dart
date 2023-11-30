// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
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
      drawer: const DrawerWidget(),
    );
  }
}
