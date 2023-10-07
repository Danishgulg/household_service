import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/constants/app_color_constants.dart';
import 'package:home_service/constants/firestore_referances.dart';
import 'package:home_service/global/screen_size.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/second_page.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/second_page_component.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/second_page_employee_crediential.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/sheet_first_page_components.dart';

import '../../../global/instances.dart';
import '../service_provider_all_bloc/services.dart/service_bloc.dart';
import '../service_provider_all_bloc/services.dart/service_event.dart';
import 'modal.dart';
import 'sheet_first_page.dart';

// Global key for form validation
GlobalKey<FormState> formStateValidationKey = GlobalKey<FormState>();

// Add service show bottom sheet button
class AddServiceButton extends StatefulWidget {
  const AddServiceButton({
    super.key,
  });

  @override
  State<AddServiceButton> createState() => _AddServiceButtonState();
}

class _AddServiceButtonState extends State<AddServiceButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          showModalBottomSheet(
            enableDrag: false,
            showDragHandle: true,
            isScrollControlled: true,
            isDismissible: false,
            context: context,
            builder: (context) {
              return BottomSheet(
                  backgroundColor: primaryColor,
                  enableDrag: true,
                  animationController: animationController,
                  onClosing: () {},
                  builder: addServiceBottomSheetBuilder);
            },
          );
        },
        icon: const Icon(Icons.add_box_outlined));
  }
}

// BottomSheet builder
Widget addServiceBottomSheetBuilder(BuildContext context) {
  return const AddServiceBottomSheet();
}

// BottomSheet
class AddServiceBottomSheet extends StatefulWidget {
  const AddServiceBottomSheet({super.key});

  @override
  State<AddServiceBottomSheet> createState() => _AddServiceBottomSheet();
}

class _AddServiceBottomSheet extends State<AddServiceBottomSheet>
    with SingleTickerProviderStateMixin {
  late PageController controller;

  @override
  void initState() {
    super.initState();

    controller = PageController()
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    double progress = controller.hasClients ? (controller.page ?? 0) : 0;
    return SizedBox(
        width: widthOfScreen,
        height: heightOfScreen * 0.55 + progress * heightOfScreen * 0.2,
        child: Scaffold(
          body: Form(
            key: formStateValidationKey,
            child: PageView(
              controller: controller,
              children: [
                BottomSheetFirstPage(nextPageOnTap: nextPageClickListener),
                BottomSheetSecondPage(
                  submitServiceInfo: submitServiceInfoClickListener,
                )
              ],
            ),
          ),
        ));
  }

  void nextPageClickListener() {
    formStateValidationKey.currentState!.validate();
    controller.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void submitServiceInfoClickListener() {
    bool isValidate = formStateValidationKey.currentState!.validate();

    if (isValidate) {
      String timeOfPost = DateTime.now().toString();
      String serviceType =
          EmployeeClassificationTextField.employeeClassificationController.text;
      String name = EmployeeNameTextField.employeeNameController.text.trim();
      String bookingPriceText =
          BookingPriceTextField.employeeBookingPriceController.text.trim();
      double bookingPrice = double.parse(bookingPriceText);
      String currency = CurrencyPicker.currency;
      String description =
          DescriptionTextField.employeeDescriptionController.text.trim();
      providedServiceColRef.doc('$timeOfPost $serviceType').set(EmployeeService(
              serviceType: serviceType,
              timeOfPost: timeOfPost,
              employeeName: name,
              bookingPrice: bookingPrice,
              currency: currency,
              description: description)
          .toMap());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Service added')));
      EmployeeNameTextField.employeeNameController.clear();
      EmployeeClassificationTextField.employeeClassificationController.clear();
      BookingPriceTextField.employeeBookingPriceController.clear();
      DescriptionTextField.employeeDescriptionController.clear();
      sharedPreferences.clear();
      context.read<ServiceBloc>().add(ServiceFetchEvent());
      Navigator.pop(context);
    }
  }
}
