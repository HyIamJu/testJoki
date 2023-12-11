import 'package:aplikasi_body_goals/pages/admin/EditTrainerPage.dart';
import 'package:aplikasi_body_goals/pages/admin/EditArticlePage.dart';
import 'package:aplikasi_body_goals/pages/admin/EditNutritionPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/LegWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutCardioWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutLegWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutNutritionPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/BulkNutritionPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/BulkReviewPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/BulkTrainerPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/PullWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/PushWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/BulkPage.dart';
import 'package:aplikasi_body_goals/pages/auth/ForgotPasswordPage.dart';
import 'package:aplikasi_body_goals/pages/auth/RegisterPage.dart';
import 'package:aplikasi_body_goals/pages/bulk/BulkWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutPullWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutPushWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutReviewPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutTrainerPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutWorkoutBodyPage.dart';
import 'package:aplikasi_body_goals/pages/cut/CutWorkoutPage.dart';
import 'package:aplikasi_body_goals/pages/profile/ProfilePage.dart';
import 'package:aplikasi_body_goals/pages/DashboardPage.dart';
import 'package:aplikasi_body_goals/pages/GetStartPage.dart';
import 'package:aplikasi_body_goals/pages/auth/LoginPage.dart';
import 'package:aplikasi_body_goals/pages/profile/ResetPassword.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String getStarted = '/getStarted';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgotPassword';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String profileResetPassword = '/profile/resetPassword';
  static const String bulk = '/bulk';
  static const String bulkWorkout = '/bulk/workout';
  static const String bulkWorkoutPush = '/bulk/workout/push';
  static const String bulkWorkoutPull = '/bulk/workout/pull';
  static const String bulkWorkoutLeg = '/bulk/workout/leg';
  static const String bulkNutrition = '/bulk/nutrition';
  static const String bulkTrainer = '/bulk/trainer';
  static const String bulkReview = '/bulk/review';
  static const String cut = '/cut';
  static const String cutWorkout = '/cut/workout';
  static const String cutWorkoutBody = '/cut/workout/body';
  static const String cutWorkoutCardio = '/cut/workout/cardio';
  static const String cutWorkoutPush = '/cut/workout/push';
  static const String cutWorkoutPull = '/cut/workout/pull';
  static const String cutWorkoutLeg = '/cut/workout/leg';
  static const String cutNutrition = '/cut/nutrition';
  static const String cutTrainer = '/cut/trainer';
  static const String cutReview = '/cut/review';
  static const String editArticle = '/admin/edit/article';
  static const String editNutrition = '/admin/edit/nutrition';
  static const String editTrainer = '/admin/edit/trainer';

  // Tambahkan rute halaman-halaman lain di sini
}

Map<String, WidgetBuilder> getAppRoutes() {
  return {
    AppRoutes.getStarted: (context) => const GetStartPage(),
    AppRoutes.login: (context) => const LoginPage(),
    AppRoutes.register: (context) => const RegisterPage(),
    AppRoutes.forgotPassword: (context) => const ForgotPasswordPage(),
    AppRoutes.dashboard: (context) => const DashboardPage(),
    AppRoutes.profile: (context) => const ProfilePage(),
    AppRoutes.profileResetPassword: (context) => const ResetPassword(),
    AppRoutes.bulk: (context) => const BulkPage(),
    AppRoutes.bulkWorkout: (context) => const BulkWorkoutPage(),
    AppRoutes.bulkWorkoutPush: (context) => const PushWorkoutPage(),
    AppRoutes.bulkWorkoutPull: (context) => const PullWorkoutPage(),
    AppRoutes.bulkWorkoutLeg: (context) => const LegWorkoutPage(),
    AppRoutes.bulkNutrition: (context) => const BulkNutritionPage(),
    AppRoutes.bulkTrainer: (context) => const BulkTrainerPage(),
    AppRoutes.bulkReview: (context) => const BulkReviewPage(),
    AppRoutes.cut: (context) => const CutPage(),
    AppRoutes.cutWorkout: (context) => const CutWorkoutPage(),
    AppRoutes.cutWorkoutBody: (context) => const CutWorkoutBodyPage(),
    AppRoutes.cutWorkoutCardio: (context) => const CutCardioWorkoutPage(),
    AppRoutes.cutWorkoutPush: (context) => const CutPushWorkoutPage(),
    AppRoutes.cutWorkoutPull: (context) => const CutPullWorkoutPage(),
    AppRoutes.cutWorkoutLeg: (context) => const CutLegWorkoutPage(),
    AppRoutes.cutNutrition: (context) => const CutNutritionPage(),
    AppRoutes.cutTrainer: (context) => const CutTrainerPage(),
    AppRoutes.cutReview: (context) => const CutReviewPage(),
    AppRoutes.editArticle: (context) => const EditArticlePage(),
    AppRoutes.editNutrition: (context) => const EditNutritionPage(),
    AppRoutes.editTrainer: (context) =>const EditTrainerPage(),
    // Tambahkan builder untuk halaman-halaman lain di sini
  };
}
