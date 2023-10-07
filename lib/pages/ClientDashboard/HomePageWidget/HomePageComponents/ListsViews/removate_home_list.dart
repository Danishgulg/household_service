import 'package:flutter/material.dart';
import 'package:home_service/global/screen_size.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/Modal/removate_home.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/ListItems/renovate_home_item.dart';

class RenovateHomeList extends StatefulWidget {
  const RenovateHomeList({super.key, required this.renovateHomeServices});
  final List<RenovateHome> renovateHomeServices;

  @override
  State<RenovateHomeList> createState() => _RenovateHomeListState();
}

class _RenovateHomeListState extends State<RenovateHomeList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.26,
      child: ListView.builder(
          padding: EdgeInsets.only(
              right: screenWidth * 0.1, left: screenWidth * 0.055),
          scrollDirection: Axis.horizontal,
          itemCount: widget.renovateHomeServices.length,
          itemBuilder: removateHomeItemBuilder),
    );
  }

  Widget? removateHomeItemBuilder(BuildContext context, int index) {
    RenovateHome renovateHomeService = widget.renovateHomeServices[index];
    return Padding(
      padding:
          EdgeInsets.only(right: screenWidth * 0.055, top: screenHeight * 0.01),
      child: RenovateHomeItem(
        imageSrc: renovateHomeService.imageSrc,
        title: renovateHomeService.title,
      ),
    );
  }
}
