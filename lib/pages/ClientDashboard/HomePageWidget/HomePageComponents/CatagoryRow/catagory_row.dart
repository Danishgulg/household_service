import 'package:flutter/material.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/global/screen_size.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: screenWidth * 0.07,
        ),
        Text(
          category,
          style: TextStyle(
              color: secondaryColor,
              fontSize: screenWidth * 0.05,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
            width: screenWidth *
                (category.endsWith('Construction') ? 0.27 : 0.40)),
        Text(
          category.endsWith('Home') || category.endsWith('Subscriptions')
              ? ''
              : 'View all',
          style: TextStyle(
              color: secondaryColor,
              fontSize: screenWidth * 0.03,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: screenWidth * 0.07,
        ),
      ],
    );
  }
}
