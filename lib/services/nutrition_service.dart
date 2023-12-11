import 'dart:convert';

import 'package:aplikasi_body_goals/model/nutrition_model.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NutritionService {
  // Fungsi untuk mengambil data profil dari API
  // static Future<List<Nutrition>> getNutrition() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('auth_token');
  //   try {
  //     var headers = {
  //       'access_token': '$token',
  //     };
  //     var request = http.Request(
  //         'GET', Uri.parse('https://api.flutterbedomain.my.id/nutrition/all'));

  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonList =
  //           jsonDecode(await response.stream.bytesToString())['data'];
  //       return jsonList.map((json) => Nutrition.fromJson(json)).toList();
  //     } else {
  //       // print(response.reasonPhrase);
  //       throw Exception('Gagal mengambil data Trainer');
  //     }
  //   } catch (error) {
  //     // Terjadi error ketika melakukan request
  //     throw Exception('Error: $error');
  //   }
  // }
  static Future<List<Nutrition>> getNutritionBulk() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      var request = http.Request('GET',
          Uri.parse('https://api.flutterbedomain.my.id/nutrition/all/bulk'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            jsonDecode(await response.stream.bytesToString())['data'];
        return jsonList.map((json) => Nutrition.fromJson(json)).toList();
      } else {
        // print(response.reasonPhrase);
        throw Exception('Gagal mengambil data Trainer');
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }

  static Future<List<Nutrition>> getNutritionCut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      var request = http.Request('GET',
          Uri.parse('https://api.flutterbedomain.my.id/nutrition/all/cut'));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final List<dynamic> jsonList =
            jsonDecode(await response.stream.bytesToString())['data'];
        return jsonList.map((json) => Nutrition.fromJson(json)).toList();
      } else {
        // print(response.reasonPhrase);
        throw Exception('Gagal mengambil data Trainer');
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }

  static Future<Map<String, String>> updateNutrition(
      UpdateNutritionModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String idNutrition = model.id.toString();
    final token = prefs.getString('auth_token');
    var url = "https://api.flutterbedomain.my.id/nutrition/$idNutrition";
    var headers = {
      'access_token': '$token',
    };
    var body = {
      'name': model.name,
      'link': model.link,
    };

    var request = http.MultipartRequest('PUT', Uri.parse(url));
    request.fields.addAll(body);
    var multipartFile =
        // await http.MultipartFile.fromPath('photo', model.photo!.path);
        await http.MultipartFile.fromPath('photo', model.photo!.path,
            contentType: MediaType.parse(model.mime!));
    request.files.add(multipartFile);
    request.headers.addAll(headers);
    // print(responseMessage);
    http.StreamedResponse response = await request.send();
    var responseMessage = jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 201) {
      // try {
      Map<String, String> map = {
        'success': 'true',
        'message': responseMessage['message'][0].toString(),
      };
      return map;
    } else {
      // } catch (error) {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': 'false',
        'message': responseMessage['errors'][0].toString(),
      };
      return map;
    }
  }
}
