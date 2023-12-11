import 'dart:io';

import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  bool isAdmin = false;
  bool isbulk = false;
  String workout = 'bulk';
  String pageAfterWorkout = 'body';
  String trainerId = '1';
  String articleId = '1';
  String nutritionId = '1';
  bool uploadedStatus = false;
  File uploadedImage = File('');
  String mimeImage = '';
  // Uint8List uploadedImage = Uint8List(0);

  void setAdminStatus(bool value) {
    isAdmin = value;
    notifyListeners();
  }

  void setBulkStatus(bool value) {
    isbulk = value;
    notifyListeners();
  }

  void setWorkoutStatus(String value) {
    workout = value;
    notifyListeners();
  }

  void setpageAfterWorkoutStatus(String value) {
    pageAfterWorkout = value;
    notifyListeners();
  }

  void setTrainerId(String value) {
    trainerId = value;
    notifyListeners();
  }

  void setArticleId(String value) {
    articleId = value;
    notifyListeners();
  }

  void setNutritionId(String value) {
    nutritionId = value;
    notifyListeners();
  }

  void setUploadedImage(File value) {
    uploadedImage = value;
    notifyListeners();
  }

  void setUploadedStatus(bool value) {
    uploadedStatus = value;
    notifyListeners();
  }

  void setUploadedMime(String value) {
    mimeImage = value;
    notifyListeners();
  }
}
