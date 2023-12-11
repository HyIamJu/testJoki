import 'dart:convert';
import 'package:aplikasi_body_goals/model/register_model.dart';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<Map<String, String>> register(Register user) async {
    final response = await http.post(
      Uri.parse('https://api.flutterbedomain.my.id/user/signup'),
      body: {
        'email': user.email,
        'name': user.name,
        'no_hp': user.phone,
        'password': user.password,
        'repassword': user.passwordConfirm,
        'user_name': user.username,
        'gender': user.gender,
        'height': user.height,
        'recent_weight': user.recentWeight,
        'goals_weight': user.goalsWeight,
      },
    );
    if (response.statusCode == 200) {
      // final Map<String, dynamic> data = json.decode(response.body);
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['message'].toString(),
      };
      return map;
    }
    //  else if (response.statusCode == 400) {
    //   return 'Akun sudah terdaftar';
    // }
    else {
      // final Map<String, dynamic> data = json.decode(response.body);
      Map<String, String> map = {
        'success': json.decode(response.body)['success'].toString(),
        'message': json.decode(response.body)['errors'][0].toString(),
      };
      return map;
      // throw Exception('Gagal Daftar');
    }
  }
}
