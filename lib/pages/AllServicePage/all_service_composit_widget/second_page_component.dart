import 'package:flutter/material.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/string_extensions_for_forms.dart';

import '../../../../constants./app_color_constants.dart';
import '../../../../constants/corner_radius.dart';
import '../../../../constants/shared_pref_keys.dart';
import '../../../../global/instances.dart';
import '../../../../global/screen_size.dart';

final double _screenWidthFirstPage = widthOfScreen;
final double _screenHeightFirstPage = heightOfScreen;

// Employee username

class EmployeeClassificationTextField extends StatefulWidget {
  const EmployeeClassificationTextField({super.key, required this.hintText});
  final String hintText;
  static late TextEditingController employeeClassificationController;

  @override
  State<EmployeeClassificationTextField> createState() =>
      _EmployeeClassificationTextField();
}

class _EmployeeClassificationTextField
    extends State<EmployeeClassificationTextField> {
  late TextEditingController employeeClassificationController;
  List<String> employeeClassificationList = [
    'Plumber',
    'Electrician',
    'Painter',
    'Carpenter',
    'Cleaning',
    'Car Cleaning',
    'Car expert',
    'Construction',
    'Architecture',
    'Interior design',
    'Furniture',
    'Home Interior',
    'Modular Kitchen',
    'Commercial Building',
    'Office Interior',
    'Pest Control',
    'Full House Cleaning',
    'Kitchen and Bathroom Cleaning'
  ];

  @override
  void initState() {
    super.initState();
    EmployeeClassificationTextField.employeeClassificationController =
        TextEditingController();
    employeeClassificationController =
        EmployeeClassificationTextField.employeeClassificationController;
  }

  @override
  void dispose() {
    sharedPreferences.setString(
        employeeClassificationTFKey, employeeClassificationController.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    employeeClassificationController.text =
        sharedPreferences.getString(employeeClassificationTFKey) ?? '';
    return SizedBox(
      width: _screenWidthFirstPage * 0.8,
      height: _screenHeightFirstPage * 0.11,
      child: DropdownButtonFormField<String>(
        validator: employeeUserNameFormValidator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          hintText: widget.hintText,
          filled: true,
          fillColor: primaryVariantColor,
        ),
        items: employeeClassificationList
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
            .toList(),
        onChanged: (String? value) {
          EmployeeClassificationTextField
              .employeeClassificationController.text = value ?? '';
        },
      ),
    );
  }

  String? employeeUserNameFormValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return 'required*';
    } else {
      return null;
    }
  }
}

// Employee booking price

class BookingPriceTextField extends StatefulWidget {
  const BookingPriceTextField({super.key, required this.hintText});
  final String hintText;
  static late TextEditingController employeeBookingPriceController;

  @override
  State<BookingPriceTextField> createState() => _BookingPriceTextFieldState();
}

class _BookingPriceTextFieldState extends State<BookingPriceTextField> {
  late TextEditingController employeeBookingPriceController;

  @override
  void initState() {
    super.initState();
    BookingPriceTextField.employeeBookingPriceController =
        TextEditingController();
    employeeBookingPriceController =
        BookingPriceTextField.employeeBookingPriceController;
  }

  @override
  void dispose() {
    sharedPreferences.setString(
        employeeBookingPriceTFKey, employeeBookingPriceController.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    employeeBookingPriceController.text =
        sharedPreferences.getString(employeeBookingPriceTFKey) ?? '';
    return SizedBox(
      width: _screenWidthFirstPage * 0.6,
      height: _screenHeightFirstPage * 0.11,
      child: TextFormField(
        validator: employeeBookingPriceFormValidator,
        controller: employeeBookingPriceController,
        keyboardType: TextInputType.number,
        maxLines: 1,
        cursorColor: secondaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldCornerRadius),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          hintText: widget.hintText,
          filled: true,
          fillColor: primaryVariantColor,
        ),
      ),
    );
  }

  String? employeeBookingPriceFormValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return 'Required*';
    } else {
      return null;
    }
  }
}

// Employee description

class DescriptionTextField extends StatefulWidget {
  const DescriptionTextField({super.key, required this.hintText});
  final String hintText;
  static late TextEditingController employeeDescriptionController;

  @override
  State<DescriptionTextField> createState() => _DescriptionTextFieldState();
}

class _DescriptionTextFieldState extends State<DescriptionTextField> {
  late TextEditingController employeeDescriptionController;
  final double _screenWidthFirstPage = widthOfScreen;
  final double _screenHeightFirstPage = heightOfScreen;

  @override
  void initState() {
    super.initState();

    DescriptionTextField.employeeDescriptionController =
        TextEditingController();
    employeeDescriptionController =
        DescriptionTextField.employeeDescriptionController;
  }

  @override
  void dispose() {
    sharedPreferences.setString(
        employeeDescriptionTFKey, employeeDescriptionController.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    employeeDescriptionController.text =
        sharedPreferences.getString(employeeDescriptionTFKey) ?? '';
    return SizedBox(
      width: _screenWidthFirstPage * 0.9,
      height: _screenHeightFirstPage * 0.4,
      child: TextFormField(
        validator: employeeDescriptionFormValidator,
        controller: employeeDescriptionController,
        maxLines: 12,
        cursorColor: secondaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(),
          errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.error)),
          hintText: widget.hintText,
          filled: true,
          fillColor: primaryVariantColor,
        ),
      ),
    );
  }

  String? employeeDescriptionFormValidator(String? value) {
    if (value.isNullOrEmpty()) {
      return 'required*';
    } else {
      return null;
    }
  }
}

// Submit service info button

class SubmitServiceButton extends StatelessWidget {
  const SubmitServiceButton({super.key, required this.onTap});
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: _screenWidthFirstPage * 0.7,
          height: _screenHeightFirstPage * 0.06,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(buttonCornerRadius),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Next',
                style: TextStyle(color: primaryColor, fontSize: 20),
              ),
              SizedBox(
                width: _screenWidthFirstPage * 0.02,
              ),
              const Icon(
                Icons.arrow_forward,
                color: primaryColor,
              )
            ],
          )),
    );
  }
}
