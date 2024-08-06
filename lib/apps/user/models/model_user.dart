// user_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

enum UserRole { normalUser, admin }

class UserModel extends IdentifierModel {
  final String firstName;
  final String lastName;
  final UserRole role;
  final String? email;
  final String? phone;
  final String? birthday;
  final String? address;
  final String? profession;

  UserModel(
    {
      required super.id,
      required this.firstName,
      required this.lastName,
      required this.role,
      this.email,
      this.phone,
      this.birthday,
      this.address,
      this.profession,
    });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      role: rolefromString(json['role']),
      email: json['email'],
      phone: json['phone'],
      birthday: json['birthday'],
      address: json['address'],
      profession: json['profession'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'role': roleToString(role),
      'email': email,
      'phone': phone,
      'birthday': birthday,
      'address': address,
      'profession': profession,
    };
  }

  factory UserModel.defaultModel() {
    return UserModel(
      id: -1,
      firstName: '',
      lastName: '',
      role: UserRole.normalUser,
      email: '',
      phone: '',
      birthday: '',
      address: '',
      profession: '',
    );
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
}
