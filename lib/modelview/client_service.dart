import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ClientService {
  static const baseUrl = 'https://caseapi.servicelabs.tech/';
  static Future<String?> post({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = 'Bearer ${prefs.getString('token')}';
    final res = await http.post(
      Uri.parse(baseUrl + endPoint),
      body: body != null ? jsonEncode(body) : null,
      headers: {'Content-Type': 'application/json', 'Authorization': token},
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    }

    return null;
  }

  static Future<String?> get({required String endPoint}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = 'Bearer ${prefs.getString('token')}';
    final res = await http.get(
      Uri.parse(baseUrl + endPoint),
      headers: {'Authorization': token},
    );
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    }

    return null;
  }

  static Future<Map<String, dynamic>?> postMultipartFile({
    required String endPoint,
    required File image,
  }) async {
    String? mimeType = lookupMimeType(image.path);
    MediaType mediaType = MediaType.parse(
      mimeType ?? 'application/octet-stream',
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = 'Bearer ${prefs.getString('token')}';

    var request = http.MultipartRequest('POST', Uri.parse(baseUrl + endPoint));

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        image.path,
        filename: path.basename(image.path),
        contentType: mediaType,
      ),
    );

    request.headers['Authorization'] = token;

    var response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final String body = await response.stream.bytesToString();

      return jsonDecode(body)['data'];
    }

    return null;
  }
}
