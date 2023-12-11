import 'dart:convert';

import 'package:aplikasi_body_goals/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profil {
  // Fungsi untuk mengambil data profil dari API
  static Future<UserProfile> getUserProfile() async {
    // final url = Uri.parse('https://api.flutterbedomain.my.id/user');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      // final response = await http.get(
      //   url,
      //   headers: <String, String>{
      //     'access_token':
      //         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwidXNlcl9uYW1lIjoiZ2VycnlhamllIiwibmFtZSI6IkdlcnJ5IEFqaWUgUHJhdGFtYSIsImVtYWlsIjoiZ2VycnlhamllQGdtYWlsLmNvbSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzAwODMyMjE3fQ.QXMX9qRX-T3elOQhzuzxLRPiMG0qhp9S1z6qXTuWrAE', // Sertakan token dalam header
      //   },
      // );

      var headers = {
        'access_token': '$token',
      };
      var request = http.Request(
          'GET', Uri.parse('https://api.flutterbedomain.my.id/user'));

      request.headers.addAll(headers);

      http.StreamedResponse response2 = await request.send();

      if (response2.statusCode == 200) {
        final Map<String, dynamic> data =
            jsonDecode(await response2.stream.bytesToString())['data'];
        final userProfile = UserProfile.fromJson(data);
        return userProfile;
      } else {
        // print(response2.reasonPhrase);
        throw Exception('Gagal mengambil data profil');
      }
      // if (response2.statusCode == 200) {
      //   // Parsing data JSON ke objek UserProfile
      //   final Map<String, dynamic> data =
      //       jsonDecode(await response2.stream.bytesToString());
      //   final userProfile = UserProfile.fromJson(data);
      //   return userProfile;
      // } else {
      //   // Gagal mengambil data profil
      //   throw Exception('Gagal mengambil data profil');
      // }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }

  Future<Map<String, String>> updateProfil(UserProfile user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      final response = await http.put(
        Uri.parse('https://api.flutterbedomain.my.id/user'),
        body: {
          'name': user.name,
          'no_hp': user.phone,
          'height': user.height,
          'goals_weight': user.goalsWeight,
        },
        headers: headers,
      );
      print(json.decode(response.body));
      // if (response.statusCode == 201) {
      // final Map<String, String> data = json.decode(response.body);
      // return data['message'];
      // } else {
      //   throw Exception('Gagal menambahkan komen');
      // }
      if (response.statusCode == 201) {
        Map<String, String> map = {
          'success': 'true',
          'message': json.decode(response.body)['message'][0].toString(),
        };
        return map;
      } else {
        Map<String, String> map = {
          'success': 'false',
          'message': json.decode(response.body)['errors'][0].toString(),
          // 'message': 'eror',
        };
        return map;
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      // throw Exception('Error: $error');
      Map<String, String> map = {
        'success': 'false',
        'message': 'Error: $error',
        // 'message': 'eror',
      };
      return map;
    }
  }

  Future<void> updatePassword(UserPassword user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    try {
      var headers = {
        'access_token': '$token',
      };
      final response = await http.put(
        Uri.parse('https://api.flutterbedomain.my.id/user/changepassword'),
        body: {
          'password': user.password,
          'confirmPassword': user.passwordConfirm,
        },
        headers: headers,
      );
      if (response.statusCode == 201) {
        // final Map<String, dynamic> data = json.decode(response.body);
        // return data['message'];
      } else {
        throw Exception('Gagal ubah password');
      }
    } catch (error) {
      // Terjadi error ketika melakukan request
      throw Exception('Error: $error');
    }
  }
}
