// job_model.dart
class HappiModel {
  final String title;
  final String type;
  final String country;
  final String field;

  HappiModel({
    required this.title,
    required this.type,
    required this.country,
    required this.field,
  });

  factory HappiModel.fromJson(Map<String, dynamic> json) {
    return HappiModel(
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
}
