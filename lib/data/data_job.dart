// jobs.dart
import 'dart:convert';
import 'package:core_dashboard/models/model_job.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<JobModel>> loadJobs() async {
  final String response = await rootBundle.loadString('apps/jobs/jobs.json');
  final List<dynamic> data = json.decode(response);
  return data.map((job) => JobModel.fromJson(job)).toList();
}
