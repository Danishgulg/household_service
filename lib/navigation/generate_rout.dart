import 'package:flutter/cupertino.dart';
import 'package:home_service/pages/ErrorPage/error_page.dart';
import '../pages/AllServicePage/all_service_page.dart';
import '../pages/ClientDashboard/Dashboard/Dashboard/dashboard.dart';
import '../pages/ServiceMasterPage/service_master_page.dart';

Route? onGenerateRout(RouteSettings settings) {
  if (settings.name == Dashboard.name) {
    return CupertinoPageRoute(builder: _clientHomeBuilder);
  } else if (settings.name == ServiceMasterPage.name) {
    return CupertinoPageRoute(builder: _serviceMasterPageRoutBuilder);
  } else if (settings.name == AllServicesPage.name) {
    return CupertinoPageRoute(builder: _allServicesPageBuilder);
  }
}

Widget _clientHomeBuilder(BuildContext context) {
  return const Dashboard();
}

Widget _serviceMasterPageRoutBuilder(BuildContext context) {
  return const ServiceMasterPage();
}

Widget _allServicesPageBuilder(BuildContext context) {
  return const AllServicesPage();
}
