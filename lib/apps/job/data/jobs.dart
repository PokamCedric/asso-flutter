// jobs.dart
import 'dart:convert';
import 'package:african_windows/apps/job/models/model_job.dart';
import 'package:african_windows/core/models_views/model_table_header.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<List<JobModel>> loadJobs() async {
  final String response = await rootBundle.loadString('apps/jobs/jobs.json');
  final List<dynamic> data = json.decode(response);
  return data.map((job) => JobModel.fromJson(job)).toList();
}


List<TableHeader> tableHeaders = [
  TableHeader(label: 'Title', propertyName: 'title', flex: 3),
  TableHeader(label: 'Field', propertyName: 'field', flex: 2),
  TableHeader(label: 'Type', propertyName: 'type'),
  TableHeader(label: 'Country', propertyName: 'country'),
];