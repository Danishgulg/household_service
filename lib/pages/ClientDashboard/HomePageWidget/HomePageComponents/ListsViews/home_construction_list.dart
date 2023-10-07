import 'package:flutter/material.dart';
import 'package:home_service/global/screen_size.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/ListItems/service_list_item.dart';

import '../Modal/home_construction.dart';

class HomeConstructionList extends StatelessWidget {
  const HomeConstructionList(
      {super.key, required this.homeConstructionServices});
  final List<HomeConstruction> homeConstructionServices;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.23,
      child: ListView.builder(
          padding: EdgeInsets.only(right: screenWidth * 0.1),
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: homeConstructionServices.length,
          itemBuilder: serviceListBuilder),
    );
  }

  Widget? serviceListBuilder(BuildContext context, int index) {
    HomeConstruction homeConstructionService = homeConstructionServices[index];
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.055, top: screenHeight * 0.01),
      child: HomePageServiceItem(
          itemImage: homeConstructionService.imageSrc,
          itemTitle: homeConstructionService.title),
    );
  }
}
