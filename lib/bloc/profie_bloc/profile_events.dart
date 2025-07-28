import 'dart:io';

abstract class ProfileEvents {}

class LoadImage extends ProfileEvents {
  final File? imageFile;
  LoadImage({this.imageFile});
}

class LoadImagePreviewEvent extends ProfileEvents {
  final File? imageFile;
  LoadImagePreviewEvent({this.imageFile});
}

class LoadFavList extends ProfileEvents {}
