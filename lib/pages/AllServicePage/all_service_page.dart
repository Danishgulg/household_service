import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/pages/AllServicePage/service_provider_all_bloc/services.dart/service_bloc.dart';
import 'package:home_service/pages/AllServicePage/service_provider_all_bloc/services.dart/service_event.dart';
import 'all_service_composit_widget/bottom_sheet.dart';
import 'all_service_composit_widget/service_list_widget.dart';

class AllServicesPage extends StatefulWidget {
  const AllServicesPage({super.key});
  static const name = '/allServices';
  static const title = 'Your Service';

  @override
  State<AllServicesPage> createState() => _AllServicesPageState();
}

class _AllServicesPageState extends State<AllServicesPage>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    context.read<ServiceBloc>().add(ServiceFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(AllServicesPage.title),
        actions: const [
          AddServiceButton(),
        ],
      ),
      body: const Align(
          alignment: Alignment.topCenter, child: ServiceAllStatesWidget()),
    );
  }
}
