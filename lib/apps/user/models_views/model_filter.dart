// filter_model.dart

class FilterModel {
  String? query;
  String? role;

  FilterModel({
    required this.role,
    this.query,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      role: json['role'],
      query: json['query'] as String?,
    );
  }

}
