// members.dart
import 'dart:convert';
import 'package:african_windows/apps/membership/members/models/model_member.dart';
import 'package:african_windows/core/models_views/model_table_header.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<MemberModel>> loadMembers() async {
  final String response = await rootBundle.loadString('apps/membership/members.json');
  final List<dynamic> data = json.decode(response);
  return data.map((member) => MemberModel.fromJson(member)).toList();
}

List<TableHeader> tableHeaders = [
  TableHeader(label: 'LastName', propertyName: 'lastName'),
  TableHeader(label: 'Firstname', propertyName: 'firstName'),
  TableHeader(label: 'Phone', propertyName: 'phone'),
  TableHeader(label: 'Email', propertyName: 'email', flex: 2),
  TableHeader(label: 'Address', propertyName: 'address', flex: 2),
];