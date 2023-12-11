import 'dart:convert';
import 'package:aplikasi_body_goals/model/auth_token_model.dart';
import 'package:aplikasi_body_goals/model/login_model.dart';
import 'package:aplikasi_body_goals/model/reset_password.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('auth_token');
    // Lakukan pengecekan otentikasi, return true jika terotentikasi, false jika tidak
    return authToken != null;
  }

  Future<Map<String, String>> login(User user) async {
    final response = await http.post(
      Uri.parse('https://api.flutterbedomain.my.id/user/login'),
      body: {
        'user_name': user.username,
        'password': user.password,
      },
    );
    // print(json.decode(response.body));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final authToken = AuthToken(token: data['token']);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('auth_token', authToken.token);
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['message'].toString(),
      };
      return map;
    } else {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['errors'][0].toString(),
      };
      return map;
    }
  }

  Future<void> logout() async {
    // Menghapus token otentikasi dari penyimpanan lokal (misalnya menggunakan shared_preferences)
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<Map<String, String>> resetPassword(ResetPassword reset) async {
    final response = await http.post(
      Uri.parse('https://api.flutterbedomain.my.id/user/forgetpassword'),
      body: {
        'email': reset.email,
      },
    );

    if (response.statusCode == 200) {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        // 'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['message'].toString(),
      };
      return map;
    } else {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': 'false',
        'message': json.decode(response.body)['message'].toString(),
      };
      return map;
      // throw Exception('Reset Password Gagal');
    }
  }
}
