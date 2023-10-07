import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/picked_image_state_widgets.dart';
import '../../../../../../constants./app_color_constants.dart';
import '../../../../../../constants/corner_radius.dart';
import '../../../../../../global/app_global_members.dart';
import '../../../../constants/shared_pref_keys.dart';
import '../../../../global/instances.dart';
import '../../../../global/screen_size.dart';
import '../service_provider_all_bloc/picked_image_bloc/picked_image_bloc.dart';

final double _screenWidthFirstPage = widthOfScreen;
final double _screenHeightFirstPage = heightOfScreen;

class EmployeeNameTextField extends StatefulWidget {
  const EmployeeNameTextField({super.key, required this.hintText});
  final String hintText;
  static late TextEditingController employeeNameController;

  @override
  State<EmployeeNameTextField> createState() => _EmployeeNameTextFieldState();
}

class _EmployeeNameTextFieldState extends State<EmployeeNameTextField> {
  late TextEditingController employeeNameController;
  @override
  void initState() {
    super.initState();
    EmployeeNameTextField.employeeNameController = TextEditingController();
    employeeNameController = EmployeeNameTextField.employeeNameController;
  }

  @override
  void dispose() {
    sharedPreferences.setString(employeeNameTFKey, employeeNameController.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    employeeNameController.text =
        sharedPreferences.getString(employeeNameTFKey) ?? '';
    return SizedBox(
      width: _screenWidthFirstPage * 0.8,
      height: _screenHeightFirstPage * 0.11,
      child: TextFormField(
        maxLength: 20,
        validator: employeeNameFormValidator,
        controller: employeeNameController,
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
}

class PickedImageWidget extends StatelessWidget {
  const PickedImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PickedImageBloc, PickedImageState>(
      builder: (context, state) {
        if (state is PickedImageInitialState) {
          return const ProviderImageInitialStateWidget();
        } else if (state is PickedImageLoadingState) {
          return const PickedImageLoadingStateState();
        } else if (state is PickedImageLoadedStateState) {
          return ProviderImageLoadedStateWidget(
            imagePath: state.imageFile,
          );
        } else if (state is PickedImageReloadedState) {
          return const ProviderImageInitialStateWidget();
        } else {
          return const ProviderImageErrorStateWidget();
        }
      },
    );
  }
}

// Image inner button dialog Widget
class ImageSourcePickerSheetWidget extends StatelessWidget {
  const ImageSourcePickerSheetWidget(
      {super.key,
      required this.cameraSourceOnPress,
      required this.fileSourceOnPress});
  final VoidCallback cameraSourceOnPress;
  final VoidCallback fileSourceOnPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightOfScreen * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: cameraSourceOnPress,
            child: const Icon(
              Icons.photo_camera_back_outlined,
              color: secondaryColor,
              size: 35,
            ),
          ),
          SizedBox(
            width: widthOfScreen * 0.05,
          ),
          ElevatedButton(
            onPressed: fileSourceOnPress,
            child: const Icon(
              Icons.file_open_outlined,
              color: secondaryColor,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

// Image inner button
class AddProviderImageButton extends StatelessWidget {
  const AddProviderImageButton({super.key, required this.pickImageOnTap});
  final GestureTapCallback pickImageOnTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: pickImageOnTap,
        child: Container(
          width: _screenWidthFirstPage * 0.4,
          height: _screenHeightFirstPage * 0.06,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(buttonCornerRadius),
          ),
          child: const Icon(
            Icons.add_a_photo_outlined,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}

// Go to next page of sheet

class GoToNextPageButton extends StatelessWidget {
  const GoToNextPageButton({super.key, required this.onTap});
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
