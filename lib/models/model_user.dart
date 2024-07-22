import 'package:african_windows/models/model_identifier.dart';


class UserModel extends IdentifierModel {
  final String email, firstName, lastName;

  UserModel(super.id, this.email, this.firstName, this.lastName);

  String get name => "$firstName $lastName";
}
