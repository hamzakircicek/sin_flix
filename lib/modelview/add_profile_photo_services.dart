import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/modelview/client_service.dart';

class AddProfilePhotoServices {
  static Future<File?> gallery() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 70,
    );
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<File?> camera() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 70,
    );
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  static Future<UserModel?> sendImage(File image) async {
    final req = await ClientService.postMultipartFile(
      endPoint: 'user/upload_photo',
      image: image,
    );
    if (req != null) {
      UserModel.clear();
      Map<String, dynamic> data = req;
      return UserModel.fromJson(data);
    }
    return null;
  }
}
