import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_service/pages/AllServicePage/all_service_composit_widget/sheet_first_page_components.dart';
import '../../../../constants./app_color_constants.dart';
import '../../../../global/screen_size.dart';
import '../service_provider_all_bloc/picked_image_bloc/picked_image_bloc.dart';

final double _screenWidthFirstPage = widthOfScreen;
final double _screenHeightFirstPage = heightOfScreen;

// Image initial widget

class ProviderImageInitialStateWidget extends StatelessWidget {
  const ProviderImageInitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: _screenWidthFirstPage * 0.9,
            height: _screenHeightFirstPage * 0.3,
            decoration: BoxDecoration(
                color: primaryVariantColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: shadowColor,
                    blurRadius: 3,
                  )
                ],
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/png.png'))),
            child: AddProviderImageButton(
              pickImageOnTap: () {
                showModalBottomSheet(
                  enableDrag: false,
                  showDragHandle: true,
                  isScrollControlled: true,
                  isDismissible: false,
                  context: context,
                  builder: (context) {
                    return ImageSourcePickerSheetWidget(
                      cameraSourceOnPress: () {
                        pickFromCamera(context);
                      },
                      fileSourceOnPress: () async {
                        pickFromGallery(context);
                      },
                    );
                  },
                );
              },
            )),
      ],
    );
  }

// Pick from Camera

  void pickFromCamera(BuildContext context) async {
    PickedImageBloc pickedImageBloc = context.read<PickedImageBloc>();
    Navigator.pop(context);
    pickedImageBloc.add(PickImageViaCameraEvent());
  }

// Pick from Gallery

  void pickFromGallery(BuildContext context) async {
    PickedImageBloc pickedImageBloc = context.read<PickedImageBloc>();
    Navigator.pop(context);
    pickedImageBloc.add(PickImageViaGalleryEvent());
  }
}

// Image Loading widget

class PickedImageLoadingStateState extends StatelessWidget {
  const PickedImageLoadingStateState({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: _screenWidthFirstPage * 0.9,
          height: _screenHeightFirstPage * 0.3,
        ),
        const CircularProgressIndicator(
          color: secondaryColor,
        ),
      ],
    );
  }
}

// Image Loaded widget
class ProviderImageLoadedStateWidget extends StatelessWidget {
  const ProviderImageLoadedStateWidget({super.key, required this.imagePath});
  final File imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _screenWidthFirstPage * 0.9,
      height: _screenHeightFirstPage * 0.3,
      decoration: BoxDecoration(
          color: primaryVariantColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: shadowColor,
              blurRadius: 3,
            )
          ],
          image:
              DecorationImage(fit: BoxFit.fill, image: FileImage(imagePath))),
      child: Center(
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                context.read<PickedImageBloc>().add(RemoveImageEvent());
              },
              child: Container(
                width: widthOfScreen * 0.1,
                height: heightOfScreen * 0.05,
                decoration: BoxDecoration(
                    color: primaryVariantColor,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.clear,
                  color: secondaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Error state widget

class ProviderImageErrorStateWidget extends StatelessWidget {
  const ProviderImageErrorStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderImageInitialStateWidget();
  }
}
