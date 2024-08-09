// member_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

enum MembershipStatus { active, inactive, suspended }

class MemberModel extends IdentifierModel {
  final String firstName;
  final String lastName;
  final String? email;
  final String? phoneNumber;
  final String? address;
  final MembershipStatus status;
  final DateTime? joinDate;
  final DateTime? dateOfBirth;
  final String? photo;

  MemberModel({
    required super.id,
    required this.firstName,
    required this.lastName,
    this.status = MembershipStatus.inactive,
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
      status: statusFromString(json['status']),
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
      'status': status.toString().split('.').last,
      'joinDate': joinDate!.toIso8601String(),
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'photo': photo,
    };
  }

  MemberModel copyWith({
    int? id,
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

  static MembershipStatus statusFromString(String status) {
    switch (status) {
      case 'active':
        return MembershipStatus.active;
      case 'suspended':
        return MembershipStatus.suspended;
      case 'inactive':
      default:
        return MembershipStatus.inactive;
    }
  }

  static String statusToString(MembershipStatus status) {
    switch (status) {
      case MembershipStatus.active:
        return 'active';
      case MembershipStatus.inactive:
        return 'inactive';
      case MembershipStatus.suspended:
        return 'suspended';
    }
  }
}
