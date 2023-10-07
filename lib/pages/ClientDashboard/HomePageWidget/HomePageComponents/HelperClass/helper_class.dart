import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/Modal/home_construction.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/Modal/home_service.dart';
import 'package:home_service/pages/ClientDashboard/HomePageWidget/HomePageComponents/Modal/removate_home.dart';

class HomePageHelper {
  static const homeInterior = 'Home Interior';
  static const modularKitchen = 'Modular Kitchen';
  static const commercialBuilding = 'Commercial Building';
  static const officeInterior = 'Office Interior';

  List<HomeService> getHomeServiceList() {
    return [
      HomeService(
        imageSrc: 'assets/service_images/plumber.png',
        title: 'Plumber',
      ),
      HomeService(
        imageSrc: 'assets/service_images/electrician.png',
        title: 'Electrician',
      ),
      HomeService(
        imageSrc: 'assets/service_images/painter.png',
        title: 'Painter',
      ),
      HomeService(
        imageSrc: 'assets/service_images/carpenter.png',
        title: 'Carpenter',
      ),
      HomeService(
        imageSrc: 'assets/service_images/cleaner.png',
        title: 'House Cleaner',
      ),
      HomeService(
        imageSrc: 'assets/service_images/car_cleaner.png',
        title: 'Car Cleaner',
      ),
      HomeService(
        imageSrc: 'assets/service_images/car_expert.png',
        title: 'Car Expert',
      ),
    ];
  }

  List<HomeConstruction> getHomeConstructionList() {
    return [
      HomeConstruction(
        imageSrc: 'assets/service_images/constructor.png',
        title: 'Construction',
      ),
      HomeConstruction(
        imageSrc: 'assets/service_images/architects.png',
        title: 'Architects',
      ),
      HomeConstruction(
        imageSrc: 'assets/service_images/interior_design.png',
        title: 'Interior Design',
      ),
      HomeConstruction(
        imageSrc: 'assets/service_images/furniture.png',
        title: 'Furniture',
      ),
      HomeConstruction(
        imageSrc: 'assets/service_images/contractor.png',
        title: 'Contractor',
      ),
    ];
  }

  List<RenovateHome> getRenovateHomeList() {
    return [
      RenovateHome(
          imageSrc: 'assets/service_images/interior.png',
          title: 'Home Interior'),
      RenovateHome(
          imageSrc: 'assets/service_images/modular_kitchen.png',
          title: 'Modular Kitchen'),
      RenovateHome(
          imageSrc: 'assets/service_images/commercial_building.png',
          title: 'Commercial Building'),
      RenovateHome(
          imageSrc: 'assets/service_images/office_interior.png',
          title: 'Office Interior')
    ];
  }
}
