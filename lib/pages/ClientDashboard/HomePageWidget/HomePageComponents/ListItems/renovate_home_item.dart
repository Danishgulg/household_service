import 'package:flutter/material.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/constants/corner_radius.dart';
import 'package:home_service/global/screen_size.dart';

import '../HelperClass/helper_class.dart';

class RenovateHomeItem extends StatelessWidget {
  const RenovateHomeItem(
      {super.key, required this.imageSrc, required this.title});
  final String imageSrc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.05),
      width: screenWidth * 0.7,
      height: screenHeight * 0.25,
      decoration: BoxDecoration(
          color: primaryVariantColor,
          borderRadius: BorderRadius.circular(cardCornerRadius),
          image:
              DecorationImage(fit: BoxFit.fill, image: AssetImage(imageSrc))),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: EdgeInsets.only(
              left: screenWidth * 0.03, right: screenWidth * 0.03),
          alignment: Alignment.centerLeft,
          width: screenWidth *
              switch (title) {
                HomePageHelper.homeInterior => 0.32,
                HomePageHelper.modularKitchen => 0.37,
                HomePageHelper.commercialBuilding => 0.45,
                HomePageHelper.officeInterior => 0.32,
                _ => 0.37
              },
          height: screenHeight * 0.04,
          decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(cardCornerRadius)),
          child: Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: primaryColor,
              shadows: const [
                BoxShadow(
                    color: Colors.black,
                    blurRadius: 3,
                    offset: Offset(2, 2),
                    spreadRadius: 3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
