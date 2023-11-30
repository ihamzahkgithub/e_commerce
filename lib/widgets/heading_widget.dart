// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/utils/app_constants.dart';
import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
// step 1 : created parameters
  final String headingTitle;
  final String headingSubtile;
  final VoidCallback onTap;
  final String buttonText;

  const HeadingWidget({
    super.key,

    // step 2 made it required
    required this.headingTitle,
    required this.headingSubtile,
    required this.onTap,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingTitle,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey.shade800),
                ),
                Text(
                  //step 3 : call it
                  headingSubtile,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: Colors.grey),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: AppConstant.appSecendoryColor,
                    width: 1.6,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: AppConstant.appMainColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
