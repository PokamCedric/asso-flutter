// filter_model.dart

import 'package:african_windows/apps/job/models/model_job.dart';

class FilterModel extends JobModel {
  String? query;

  FilterModel({
    required super.type,
    required super.country,
    required super.field,
    this.query,
  }): super(title: '', id: -1);

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      type: json['type'] as String,
      country: json['country'] as String,
      field: json['field'] as String,
      query: json['query'] as String?,
    );
  }

}
