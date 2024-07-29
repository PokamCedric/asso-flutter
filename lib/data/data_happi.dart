// jobs.dart
import 'dart:convert';
import 'package:african_windows/models/model_happi.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<HappiModel>> loadJobs() async {
  final String response = await rootBundle.loadString('apps/happi/happi.json');
  final List<dynamic> data = json.decode(response);
  return data.map((job) => HappiModel.fromJson(job)).toList();
}
