import 'package:african_windows/shared/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:african_windows/utils/local_storage.dart';
import 'package:african_windows/models/model_user.dart';

class AuthService {
  static bool isLoggedIn = false;
  static UserModel currentUser = dummyUserModel;

  static UserModel get dummyUserModel =>
      UserModel(-1, "cedric@asso.com", "Cedric", "Pokam", "admin");

  static UserModel get secondUserModel =>
      UserModel(-2, "happi@asso.com", "Happi", "Kenway", "admin");

  static Future<Map<String, String>?> loginUserModel(
      Map<String, dynamic> data, BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));

    if (data['email'] == dummyUserModel.email) {
      if (data['password'] != "1234567") {
        return {"password": "Password is incorrect"};
      }
      isLoggedIn = true;
      currentUser = dummyUserModel;
    } else if (data['email'] == secondUserModel.email) {
      if (data['password'] != "kenway123") {
        return {"password": "Password is incorrect"};
      }
      isLoggedIn = true;
      currentUser = secondUserModel;
    } else {
      return {"email": "This email is not registered"};
    }

    await LocalStorage.setLoggedInUser(true);

    // Redirection après la connexion
    Navigator.of(context).pushReplacementNamed(
      currentUser.email == secondUserModel.email
          ? Routes.happiDashboard
          : Routes.dashboard,
    );

    return null;
  }

  static bool get isAdmin => currentUser.role == 'admin';

  static void logout() {
    isLoggedIn = false;
    currentUser = dummyUserModel;
    LocalStorage.setLoggedInUser(false);
  }
}
