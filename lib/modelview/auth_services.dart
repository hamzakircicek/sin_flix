import 'dart:convert';
import 'package:movie_app/model/login_model.dart';
import 'package:movie_app/model/register_model.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/modelview/client_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  static Future<UserModel?> registerNow(RegisterModel register) async {
    Map<String, dynamic> body = register.toMap(register);
    final response = await ClientService.post(
      endPoint: 'user/register',
      body: body,
    );
    if (response != null) {
      final data = jsonDecode(response);
      UserModel user = UserModel.fromJson(data['data']);

      return user;
    }
    return null;
  }

  static Future<UserModel?> login(
    LoginModel login,
    SharedPreferences? pref,
  ) async {
    Map<String, dynamic> body = login.toMap(login);
    final response = await ClientService.post(
      endPoint: 'user/login',
      body: body,
    );
    if (response != null) {
      final data = jsonDecode(response);

      UserModel user = UserModel.fromJson(data['data']);
      if (pref != null && user.token != null) {
        await pref.setString('token', user.token!);
      }

      return user;
    }
    return null;
  }
}
