part of 'picked_image_bloc.dart';

sealed class PickedImageState {}

final class PickedImageInitialState extends PickedImageState {
  PickedImageInitialState();
}

final class PickedImageLoadingState extends PickedImageState {}

final class PickedImageLoadedStateState extends PickedImageState {
  final File imageFile;
  PickedImageLoadedStateState({required this.imageFile});
}

final class PickedImageErrorState extends PickedImageState {
  final String imageFile;

  PickedImageErrorState({required this.imageFile});
}

final class PickedImageReloadedState extends PickedImageState {}
