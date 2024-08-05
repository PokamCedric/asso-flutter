// user_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

enum UserRole { normalUser, admin }

class UserModel extends IdentifierModel {
  final String email;
  final String firstName;
  final String lastName;
  final UserRole role;

  UserModel(
    {
      required super.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.role,
    });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: rolefromString(json['role']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': roleToString(role),
    };
  }

  static UserRole rolefromString(String role){
    switch (role) {
      case 'admin':
        return UserRole.admin;
      case 'user':
      default:
        return UserRole.normalUser;
    }
  }

  static String roleToString(UserRole role){
    switch (role) {
      case UserRole.admin:
        return 'admin';
      case UserRole.normalUser:
      default:
        return 'user';
    }
  }

  factory UserModel.defaultModel() {
    return UserModel(
      id: -1,
      email: '',
      firstName: 'Unselected',
      lastName: 'Unselected',
      role: UserRole.normalUser,
    );
  }
}
