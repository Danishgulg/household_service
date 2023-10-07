import 'package:flutter/material.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/sheet_first_page_components.dart';

import '../../../../global/screen_size.dart';

class BottomSheetFirstPage extends StatelessWidget {
  const BottomSheetFirstPage({super.key, required this.nextPageOnTap});
  final GestureTapCallback nextPageOnTap;
  static const name = 'Employee name';

  static const radius = 80.0;
  @override
  Widget build(BuildContext context) {
    final double screenHeightFirstPage = heightOfScreen;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(
              height: screenHeightFirstPage * 0.03,
            ),
            const EmployeeNameTextField(
              hintText: name,
            ),
            const PickedImageWidget(),
            SizedBox(
              height: screenHeightFirstPage * 0.02,
            ),
            GoToNextPageButton(onTap: nextPageOnTap),
            SizedBox(
              height: screenHeightFirstPage * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
