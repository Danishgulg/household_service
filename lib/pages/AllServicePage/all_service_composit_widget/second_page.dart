import 'package:flutter/cupertino.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/second_page_component.dart';
import '../../../../global/screen_size.dart';
import 'second_page_employee_crediential.dart';

class BottomSheetSecondPage extends StatelessWidget {
  const BottomSheetSecondPage({super.key, required this.submitServiceInfo});
  static const description = 'Description';
  static const userName = 'User Name';
  final GestureTapCallback submitServiceInfo;

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
            const EmployeeCredentials(),
            const EmployeeClassificationTextField(
              hintText: userName,
            ),
            const DescriptionTextField(
              hintText: description,
            ),
            SizedBox(
              height: screenHeightFirstPage * 0.03,
            ),
            SubmitServiceButton(
              onTap: submitServiceInfo,
            ),
            SizedBox(
              height: screenHeightFirstPage * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
