import 'package:flutter/material.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/constants/corner_radius.dart';

import '../../../global/screen_size.dart';
import '../../AllServicePage/all_service_page.dart';

final double _screenWidthFirstPage = widthOfScreen;
final double _screenHeightFirstPage = heightOfScreen;

// Master page services

class ServiceMasterPageInfoWidgets extends StatelessWidget {
  const ServiceMasterPageInfoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AllServicesPage.name);
          },
          child: const ServiceMasterPageInfoWidget(
              itemImage: 'assets/images/add_service.jpg',
              itemTitle: 'Your services'),
        ),
        const ServiceMasterPageInfoWidget(
          itemImage: 'assets/images/service_status.jpg',
          itemTitle: 'Service status',
        ),
      ],
    );
  }
}

// Master page service info Widget
class ServiceMasterPageInfoWidget extends StatelessWidget {
  const ServiceMasterPageInfoWidget(
      {super.key, required this.itemImage, required this.itemTitle});
  final String itemImage;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    var itemWidth = screenWidth * 0.4;
    return SizedBox(
      width: itemWidth,
      height: screenHeight * 0.3,
      child: Column(
        children: [
          Container(
            width: itemWidth,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: shadowColor, blurRadius: 5, offset: Offset(3, 3))
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
            child: Text(
              itemTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
