import 'package:aplikasi_body_goals/model/user_info_response.dart';
import 'package:aplikasi_body_goals/services/all_services.dart';
import 'package:flutter/material.dart';

import '../utils/finite_state.dart';

class UserStatusProvider extends ChangeNotifier {
  final service = AllServices();
  MyState state = MyState.loading;

  UserInfoResponseModel? userinfo;

  Future<void> getUserInfo() async {
    if (state == MyState.loaded || state == MyState.failed) {
      state = MyState.loading;
      notifyListeners();
    }
    try {
      final response = await service.getInfoUsers();
      userinfo = response;

      state = MyState.loaded;
      notifyListeners();
    } catch (e) {
      state = MyState.failed;
      notifyListeners();
    }
  }
}
