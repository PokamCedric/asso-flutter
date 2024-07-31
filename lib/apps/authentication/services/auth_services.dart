import 'package:african_windows/models/model_user.dart';
import 'package:african_windows/utils/local_storage/local_storage.dart';

class AuthService {
  static bool isLoggedIn = false;
  static UserModel currentUser = dummyUserModel;

  static UserModel get dummyUserModel =>
      UserModel(-1, "cedric@asso.com", "Cedric", "Pokam", UserRole.admin);

  // Example method for logging in a user and setting their role
  static Future<Map<String, String>?> loginUserModel(Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 1));
    if (data['email'] != dummyUserModel.email) {
      return {"email": "This email is not registered"};
    } else if (data['password'] != "1234567") {
      return {"password": "Password is incorrect"};
    }

    isLoggedIn = true;
    currentUser = dummyUserModel; // Assign the dummy user to currentUser for this example
    await LocalStorage.setLoggedInUser(true);
    return null;
  }

  static bool get isAdmin => currentUser.role == UserRole.admin;

  static void logout() {
    isLoggedIn = false;
    currentUser = dummyUserModel;
    LocalStorage.setLoggedInUser(false);
  }
}
