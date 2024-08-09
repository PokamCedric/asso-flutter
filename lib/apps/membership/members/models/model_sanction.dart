class SanctionModel {
  final String id;
  final String memberId;
  final String description;
  final DateTime dateIssued;
  final DateTime? dateLifted;
  final SanctionType type;
  final SanctionStatus status;

  SanctionModel({
    required this.id,
    required this.memberId,
    required this.description,
    required this.dateIssued,
    this.dateLifted,
    required this.type,
    required this.status,
  });

  // Method to convert from JSON to SanctionModel
  factory SanctionModel.fromJson(Map<String, dynamic> json) {
    return SanctionModel(
      id: json['id'],
      memberId: json['memberId'],
      description: json['description'],
      dateIssued: DateTime.parse(json['dateIssued']),
      dateLifted: json['dateLifted'] != null ? DateTime.parse(json['dateLifted']) : null,
      type: SanctionTypeExtension.fromString(json['type']),
      status: SanctionStatusExtension.fromString(json['status']),
    );
  }

  // Method to convert from SanctionModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'memberId': memberId,
      'description': description,
      'dateIssued': dateIssued.toIso8601String(),
      'dateLifted': dateLifted?.toIso8601String(),
      'type': type.toStringValue(),
      'status': status.toStringValue(),
    };
  }

  // Copy with method
  SanctionModel copyWith({
    String? id,
    String? memberId,
    String? description,
    DateTime? dateIssued,
    DateTime? dateLifted,
    SanctionType? type,
    SanctionStatus? status,
  }) {
    return SanctionModel(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      description: description ?? this.description,
      dateIssued: dateIssued ?? this.dateIssued,
      dateLifted: dateLifted ?? this.dateLifted,
      type: type ?? this.type,
      status: status ?? this.status,
    );
  }
}

// Enum for SanctionType
enum SanctionType {
  warning,
  suspension,
  expulsion,
}

extension SanctionTypeExtension on SanctionType {
  String toStringValue() {
    switch (this) {
      case SanctionType.warning:
        return 'warning';
      case SanctionType.suspension:
        return 'suspension';
      case SanctionType.expulsion:
        return 'expulsion';
    }
  }

  static SanctionType fromString(String value) {
    switch (value) {
      case 'warning':
        return SanctionType.warning;
      case 'suspension':
        return SanctionType.suspension;
      case 'expulsion':
        return SanctionType.expulsion;
      default:
        throw Exception('Unknown SanctionType: $value');
    }
  }
}

// Enum for SanctionStatus
enum SanctionStatus {
  active,
  lifted,
  expired,
}

extension SanctionStatusExtension on SanctionStatus {
  String toStringValue() {
    switch (this) {
      case SanctionStatus.active:
        return 'active';
      case SanctionStatus.lifted:
        return 'lifted';
      case SanctionStatus.expired:
        return 'expired';
    }
  }

  static SanctionStatus fromString(String value) {
    switch (value) {
      case 'active':
        return SanctionStatus.active;
      case 'lifted':
        return SanctionStatus.lifted;
      case 'expired':
        return SanctionStatus.expired;
      default:
        throw Exception('Unknown SanctionStatus: $value');
    }
  }
}
