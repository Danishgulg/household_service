import 'package:flutter/material.dart';
import 'package:home_service/global/screen_size.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/ListItems/service_list_item.dart';

import '../Modal/home_service.dart';

class HomeServiceList extends StatelessWidget {
  const HomeServiceList({super.key, required this.homeServices});
  final List<HomeService> homeServices;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.23,
      child: ListView.builder(
          padding: EdgeInsets.only(
              right: screenWidth * 0.1, left: screenWidth * 0.055),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeServices.length,
          itemBuilder: serviceListBuilder),
    );
  }

  Widget? serviceListBuilder(BuildContext context, int index) {
    HomeService homeService = homeServices[index];
    return Padding(
      padding:
          EdgeInsets.only(right: screenWidth * 0.055, top: screenHeight * 0.01),
      child: HomePageServiceItem(
          itemImage: homeService.imageSrc, itemTitle: homeService.title),
    );
  }
}
