import 'package:flutter/material.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/constants/corner_radius.dart';
import 'package:home_service/global/screen_size.dart';

class HomePageServiceItem extends StatelessWidget {
  const HomePageServiceItem(
      {super.key, required this.itemImage, required this.itemTitle});
  final String itemImage;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    var itemWidth = screenWidth * 0.27;
    return SizedBox(
      width: itemWidth,
      height: screenHeight * 0.21,
      child: Column(
        children: [
          Container(
            width: itemWidth,
            height: screenHeight * 0.16,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: shadowColor, blurRadius: 2, offset: Offset(1, 1))
                ],
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(itemImage)),
                color: primaryVariantColor,
                borderRadius: BorderRadius.circular(cardCornerRadius)),
          ),
          SizedBox(
            height: screenHeight * 0.015,
          ),
          Container(
            alignment: Alignment.center,
            width: itemWidth,
            height: screenHeight * 0.035,
            decoration: BoxDecoration(
                color: primaryVariantColor,
                borderRadius: BorderRadius.circular(cardCornerRadius)),
            child: Text(itemTitle),
          ),
        ],
      ),
    );
  }
}
