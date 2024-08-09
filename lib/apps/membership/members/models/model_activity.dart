// activity_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

class ActivityModel extends IdentifierModel {
  final String name;
  final String? description;
  final DateTime date;
  final String location;
  final int organizerId;

  ActivityModel({
    required super.id,
    required this.name,
    required this.date,
    required this.location,
    required this.organizerId,
    this.description,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) {
    return ActivityModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      location: json['location'],
      organizerId: json['organizerId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'date': date.toIso8601String(),
      'location': location,
      'organizerId': organizerId,
    };
  }

  ActivityModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? date,
    String? location,
    int? organizerId,
  }) {
    return ActivityModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      location: location ?? this.location,
      organizerId: organizerId ?? this.organizerId,
    );
  }
}
