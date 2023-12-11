import 'dart:convert';

import 'package:aplikasi_body_goals/model/review_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ReviewService {
  // Fungsi untuk mengambil data profil dari API
  static Future<List<Review>> getReview() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      var request = http.Request(
          'GET', Uri.parse('https://api.flutterbedomain.my.id/comment/all'));

      request.headers.addAll(headers);

      http.StreamedResponse response2 = await request.send();

      if (response2.statusCode == 200) {
        // final Map<String, dynamic> data =
        //     jsonDecode(await response2.stream.bytesToString())['data'];
        // final userProfile = UserProfile.fromJson(data);
        final List<dynamic> jsonList =
            jsonDecode(await response2.stream.bytesToString())['data'];
        return jsonList.map((json) => Review.fromJson(json)).toList();
      } else {
        // print(response2.reasonPhrase);
        throw Exception('Gagal mengambil data review');
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }

  Future<void> storeReview(AddReview review) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      final response = await http.post(
        Uri.parse('https://api.flutterbedomain.my.id/comment/create'),
        body: {
          'comment': review.comment,
          'rating': review.rating,
        },
        headers: headers,
      );
      if (response.statusCode == 201) {
        final Map<String, dynamic> data = json.decode(response.body);
        return data['message'];
      } else {
        throw Exception('Gagal menambahkan komen');
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }
}
