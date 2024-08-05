// job_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

class JobModel extends IdentifierModel {
  final String title;
  final String type;
  final String country;
  final String field;

  JobModel(
    {
      required super.id,
      required this.title,
      required this.type,
      required this.country,
      required this.field,
    });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['id'] as String,
      title: json['title'] as String,
      type: json['type'] as String,
      country: json['country'] as String,
      field: json['field'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'type': type,
      'country': country,
      'field': field,
    };
  }

  factory JobModel.defaultModel() {
    return JobModel(
      id: -1,
      title: '',
      type: 'Unselected',
      country: 'Unselected',
      field: 'Unselected',
    );
  }
}
