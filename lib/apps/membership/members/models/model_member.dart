// member_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

enum MembershipStatus { active, inactive, pending }

class MemberModel extends IdentifierModel {
  final String firstName;
  final String lastName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final MembershipStatus status;
  final DateTime joinDate;
  final DateTime? dateOfBirth;
  final String? photo;

  MemberModel({
    required super.id,
    required this.firstName,
    required this.lastName,
    required this.status,
    required this.joinDate,
    this.email,
    this.phoneNumber,
    this.address,
    this.dateOfBirth,
    this.photo,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) {
    return MemberModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      status: MembershipStatusExtension.fromString(json['status']),
      joinDate: DateTime.parse(json['joinDate']),
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.parse(json['dateOfBirth'])
          : null,
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'address': address,
      'status': status.toStringValue(),
      'joinDate': joinDate.toIso8601String(),
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'photo': photo,
    };
  }

  MemberModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? address,
    MembershipStatus? status,
    DateTime? joinDate,
    DateTime? dateOfBirth,
    String? photo,
  }) {
    return MemberModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      status: status ?? this.status,
      joinDate: joinDate ?? this.joinDate,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      photo: photo ?? this.photo,
    );
  }
}

// Extension for MembershipStatus
extension MembershipStatusExtension on MembershipStatus {
  String toStringValue() {
    return toString().split('.').last;
  }

  static MembershipStatus fromString(String value) {
    return MembershipStatus.values.firstWhere((e) => e.toString().split('.').last == value);
  }

  static List<String> toList() {
    return MembershipStatus.values.map((status) => status.toShortString()).toList();
  }

  String toShortString() {
    return toString().split('.').last;
  }
}
