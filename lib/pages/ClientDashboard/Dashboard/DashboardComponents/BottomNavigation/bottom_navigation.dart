import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'bloc/index_bloc.dart';

class DashboardBottomNavigation extends StatelessWidget {
  static const selectedFontSize = 18.0;

  const DashboardBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IndexBloc, ChangedIndexState>(
      builder: (context, state) {
        return BottomNavigationBar(
            backgroundColor: primaryVariantColor,
            currentIndex: state.index,
            selectedFontSize: selectedFontSize,
            selectedItemColor: secondaryColor,
            showSelectedLabels: true,
            unselectedIconTheme: const IconThemeData(color: Colors.black38),
            type: BottomNavigationBarType.shifting,
            onTap: (value) {
              context.read<IndexBloc>().add(ChangeIndexEvent(index: value));
            },
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: 'Services',
                  icon: Icon(
                    Icons.home_repair_service_outlined,
                  )),
              BottomNavigationBarItem(
                  label: 'Booking',
                  icon: Icon(
                    Icons.book_outlined,
                  )),
              BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ))
            ]);
      },
    );
  }
}
