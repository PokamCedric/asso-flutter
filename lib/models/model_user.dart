import 'package:african_windows/models/model_identifier.dart';


class UserModel extends IdentifierModel {
  final String email;
  final String firstName;
  final String lastName;
  final String role;

  UserModel(super.id, this.email, this.firstName, this.lastName, this.role);

  String get name => "$firstName $lastName";
}
