import 'package:flutter/cupertino.dart';
import '../../../../../constants./app_color_constants.dart';
import '../../../../../constants/corner_radius.dart';
import '../../../../../global/screen_size.dart';

class ClientHomeSlider extends StatelessWidget {
  const ClientHomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
          color: primaryVariantColor,
          borderRadius: BorderRadius.circular(cardCornerRadius)),
    );
  }
}
