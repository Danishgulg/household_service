import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/constants/corner_radius.dart';

import '../../../../global/screen_size.dart';
import 'modal.dart';

final double _screenWidthFirstPage = widthOfScreen;
final double _screenHeightFirstPage = heightOfScreen;

// Initial state widget
class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('No Data Yet!!');
  }
}

// Loading state widget

class LoadingStateWidget extends StatelessWidget {
  const LoadingStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: secondaryColor,
      ),
    );
  }
}

// Loaded state widget

class LoadedStateWidget extends StatelessWidget {
  const LoadedStateWidget({super.key, required this.services});

  final List<EmployeeService> services;

  @override
  Widget build(BuildContext context) {
    return ServicesList(
      services: services,
    );
  }
}

// Error state widget
class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget({super.key, required this.error});

  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(error));
  }
}

// Service list
class ServicesList extends ListView {
  ServicesList({required List<EmployeeService> services, super.key})
      : super.builder(
            clipBehavior: Clip.none,
            padding: EdgeInsets.only(
                left: widthOfScreen * 0.07, right: widthOfScreen * 0.07),
            itemCount: services.length,
            itemExtent: heightOfScreen * 0.25,
            itemBuilder: (context, index) => ServiceItem(
                  context: context,
                  index: index,
                  services: services,
                ));
}

// Service list item

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {super.key,
      required this.context,
      required this.index,
      required this.services});
  final BuildContext context;
  final int index;
  final List<EmployeeService> services;

  @override
  Widget build(BuildContext context) {
    EmployeeService service = services[index];
    return Padding(
      padding: EdgeInsets.only(
          top: _screenHeightFirstPage * 0.02,
          bottom: _screenHeightFirstPage * 0.02),
      child: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: primaryVariantColor,
            borderRadius: BorderRadius.circular(cardCornerRadius),
            image: const DecorationImage(
                opacity: 0.1,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/add_service.jpg'))),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: _screenWidthFirstPage * 0.05,
                    top: _screenWidthFirstPage * 0.05),
                child: Text(service.employeeName,
                    style: GoogleFonts.calistoga(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: _screenWidthFirstPage * 0.045)),
              ),
            ),
            SizedBox(
              height: _screenHeightFirstPage * 0.01,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: _screenWidthFirstPage * 0.15),
                child: Text(service.serviceType,
                    style: GoogleFonts.calistoga(
                        color: secondaryColor,
                        fontWeight: FontWeight.w300,
                        fontSize: widthOfScreen * 0.035)),
              ),
            ),
            SizedBox(
              height: _screenHeightFirstPage * 0.06,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right: _screenWidthFirstPage * 0.05,
                ),
                child: Text('${service.currency} | ${service.bookingPrice}/hr',
                    style: GoogleFonts.forum(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: widthOfScreen * 0.045)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
