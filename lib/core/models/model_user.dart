import 'package:african_windows/core/models/model_identifier.dart';

enum UserRole { normalUser, admin }

class UserModel extends IdentifierModel {
  final String email;
  final String firstName;
  final String lastName;
  final UserRole role;

  UserModel(super.id, this.email, this.firstName, this.lastName, this.role);

  String get name => "$firstName $lastName";
}
