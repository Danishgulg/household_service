import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/pages/ClientDashboard/Dashboard/DashboardComponents/BottomNavigation/bloc/index_bloc.dart';
import '../../../ServiceMasterPage/service_master_page.dart';
import '../../HomePageWidget/client_home_page/client_home_page.dart';
import '../DashboardComponents/BottomNavigation/bottom_navigation.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const name = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static const zerothIndex = 0;
  static const firstIndex = 1;
  static const secondIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const DashboardBottomNavigation(),
        body: BlocBuilder<IndexBloc, ChangedIndexState>(
            bloc: context.read<IndexBloc>(), builder: navigationWidgetBuilder));
  }

  Widget navigationWidgetBuilder(
      BuildContext context, ChangedIndexState state) {
    if (state.index == zerothIndex) {
      return const HomePageWidget();
    } else if (state.index == firstIndex) {
      return const ServiceMasterPage();
    } else if (state.index == secondIndex) {
      return Container(
        color: Colors.blue,
      );
    } else {
      return Container(
        color: Colors.red,
      );
    }
  }
}
