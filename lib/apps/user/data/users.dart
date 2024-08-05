// users.dart
import 'dart:convert';
import 'package:african_windows/apps/user/models/model_user.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<UserModel>> loadUsers() async {
  final String response = await rootBundle.loadString('apps/users/users.json');
  final List<dynamic> data = json.decode(response);
  return data.map((user) => UserModel.fromJson(user)).toList();
}
