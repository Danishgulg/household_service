import 'package:flutter/material.dart';
import 'package:home_service/global/screen_size.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/HelperClass/helper_class.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/ListsViews/home_construction_list.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/ListsViews/home_service_list.dart';
import '../HomePageComponents/CatagoryRow/catagory_row.dart';
import '../HomePageComponents/ListsViews/removate_home_list.dart';
import '../HomePageComponents/Slider/slider.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  // Helper class object

  HomePageHelper helper = HomePageHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                const ClientHomeSlider(),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                const CategoryRow(
                  category: 'Home Service',
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                HomeServiceList(homeServices: helper.getHomeServiceList()),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                const CategoryRow(
                  category: 'Home Construction',
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                HomeConstructionList(
                    homeConstructionServices: helper.getHomeConstructionList()),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                const CategoryRow(
                  category: 'Renovate Home',
                ),
                SizedBox(
                  height: screenHeight * 0.015,
                ),
                RenovateHomeList(
                    renovateHomeServices: helper.getRenovateHomeList()),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
              ],
            )),
      ),
    );
  }
}
