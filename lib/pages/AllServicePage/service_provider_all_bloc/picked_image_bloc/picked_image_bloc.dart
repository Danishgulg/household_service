import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
part 'picked_image_event.dart';
part 'picked_image_state.dart';

class PickedImageBloc extends Bloc<PickImageEvent, PickedImageState> {
  ImagePicker imagePicker = ImagePicker();

  PickedImageBloc() : super(PickedImageInitialState()) {
    on<PickImageViaCameraEvent>((event, emit) async {
      emit(PickedImageLoadingState());
      try {
        XFile? imageXFile =
            await imagePicker.pickImage(source: ImageSource.gallery);
        File imageFile = File(imageXFile!.path);
        emit(PickedImageLoadedStateState(imageFile: imageFile));
      } catch (e) {
        emit(PickedImageErrorState(imageFile: 'assets/images/png.png'));
      }
    });

    on<PickImageViaGalleryEvent>((event, emit) async {
      emit(PickedImageLoadingState());
      try {
        XFile? imageXFile =
            await imagePicker.pickImage(source: ImageSource.gallery);
        File imageFile = File(imageXFile!.path);
        emit(PickedImageLoadedStateState(imageFile: imageFile));
      } catch (e) {
        PickedImageErrorState(imageFile: 'assets/images/png.png');
      }
    });
    on<RemoveImageEvent>(
      (event, emit) {
        emit(PickedImageReloadedState());
      },
    );
  }
}
