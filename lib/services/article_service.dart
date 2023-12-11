import 'dart:convert';

import 'package:aplikasi_body_goals/model/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArticleService {
  static Future<List<Article>> getArticle() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    // try {
    var headers = {
      'access_token': '$token',
    };
    var request = http.Request(
        'GET', Uri.parse('https://api.flutterbedomain.my.id/event/all'));

    request.headers.addAll(headers);

    http.StreamedResponse response2 = await request.send();

    if (response2.statusCode == 200) {
      // final Map<String, dynamic> data =
      //     jsonDecode(await response2.stream.bytesToString())['data'];
      // final userProfile = UserProfile.fromJson(data);
      final List<dynamic> jsonList =
          jsonDecode(await response2.stream.bytesToString())['data'];
      return jsonList.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data review');
    }
    // } catch (error) {
    //   return [];
    //   // Terjadi error ketika melakukan request
    //   throw Exception('Error: $error');
    // }
  }

  static Future<Map<String, String>> updateArticle(
      UpdateArticleModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    var headers = {
      'access_token': '$token',
    };
    final response = await http.post(
      Uri.parse('https://api.flutterbedomain.my.id/user/login'),
      body: {
        'user_name': model.title,
        'password': model.photo,
      },
      headers: headers,
    );
    try {
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['message'].toString(),
      };
      return map;
    } catch (error) {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['errors'][0].toString(),
      };
      return map;
    }
  }
}
