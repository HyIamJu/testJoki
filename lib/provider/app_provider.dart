import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  bool isAuthenticated = false;
  bool isAdmin = false;

  void setAdminStatus(bool value) {
    isAdmin = value;
    notifyListeners();
  }

  void setAuthStatus(bool value) {
    isAuthenticated = value;
    notifyListeners();
  }
}
