
import 'package:core_dashboard/models/model_user.dart';
import 'package:core_dashboard/utils/local_storage.dart';

class AuthService {
  static bool isLoggedIn = false;

  static UserModel get dummyUserModel =>
      UserModel(-1, "cedric@asso.com", "Cedric", "Pokam");

  static Future<Map<String, String>?> loginUserModel(
      Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
    if (data['email'] != dummyUserModel.email) {
      return {"email": "This email is not registered"};
    } else if (data['password'] != "1234567") {
      return {"password": "Password is incorrect"};
    }

    isLoggedIn = true;
    await LocalStorage.setLoggedInUser(true);
    return null;
  }
}
