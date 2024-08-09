// filter_model.dart

class FilterModel {
  String? query;
  String? status;

  FilterModel({
    required this.status,
    this.query,
  });

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(
      status: json['status']?? 'member',
      query: json['query'] ?? '',
    );
  }

}
