part of 'picked_image_bloc.dart';

sealed class PickImageEvent {}

class PickImageViaCameraEvent extends PickImageEvent {
  PickImageViaCameraEvent();
}

class PickImageViaGalleryEvent extends PickImageEvent {
  PickImageViaGalleryEvent();
}

class RemoveImageEvent extends PickImageEvent {}
