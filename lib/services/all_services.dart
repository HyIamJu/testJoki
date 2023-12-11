import 'dart:io';

import 'package:aplikasi_body_goals/model/user_info_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/config_app.dart';

class AllServices {
  //--singleton--
  static final AllServices _instance = AllServices._internal();
  AllServices._internal();
  factory AllServices() {
    return _instance;
  }

  //-- dio initialize--
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ConfigApp.baseUrl,
    ),
  );

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return token ?? "";
  }

//----------------------------------------------------------------------------------------//

  Future<UserInfoResponseModel> getInfoUsers() async {
    try {
      String token = await getToken();
      final response = await _dio.get(
        '/user',
        options: Options(
          headers: {
            'access_token': token,
          },
        ),
      );

      UserInfoResponseModel result =
          UserInfoResponseModel.fromJson(response.data);

      return result;
    } on DioException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> uploadImage({
    required File file,
    required String title,
    required String detail,
    required String idArticle,
  }) async {
    try {
      String token = await getToken();
      String fileName = file.path.split('/').last;

      var formData = FormData.fromMap({
        'photoEvent': await MultipartFile.fromFile(file.path, filename: file.),
      });
      // FormData formData = FormData.fromMap({
      //   "title": title,
      //   "detail": detail,
      //   "photoEvent":
      //       await MultipartFile.fromFile(file.path, filename: fileName),
      // });
      var response = await _dio.put(
        "/event/$idArticle",
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'access_token': token,
          },
        ),
      );
      return response.data['message'];
    } on DioException catch (e) {
      return e.response?.data['errors'] ?? "gagal mengubah artikel";
    }
  }

  // Future<String> updateAritcle(File file) async {
  //   try {
  //     String fileName = file.path.split('/').last;
  //     FormData formData = FormData.fromMap(
  //       {
  //         "pictures": await MultipartFile.fromFile(
  //           file.path,
  //           filename: fileName,
  //         ),
  //       },
  //     );

  //     final response = await _dio.put('/pictures', data: formData);
  //     final image = response.data["urls"][0];
  //     return image;
  //   } on DioError catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}
