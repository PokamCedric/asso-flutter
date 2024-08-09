// membership_fee_model.dart
import 'package:african_windows/core/models/model_identifier.dart';

enum PaymentStatus { paid, pending, canceled }

class MembershipFeeModel extends IdentifierModel {
  final int memberId;
  final double amount;
  final DateTime paymentDate;
  final String paymentMethod;
  final PaymentStatus status;
  final String? description;

  MembershipFeeModel({
    required super.id,
    required this.memberId,
    required this.amount,
    required this.paymentDate,
    required this.paymentMethod,
    required this.status,
    this.description,
  });

  factory MembershipFeeModel.fromJson(Map<String, dynamic> json) {
    return MembershipFeeModel(
      id: json['id'],
      memberId: json['memberId'],
      amount: json['amount'],
      paymentDate: DateTime.parse(json['paymentDate']),
      paymentMethod: json['paymentMethod'],
      status: PaymentStatus.values.firstWhere(
          (e) => e.toString() == 'PaymentStatus.${json['status']}'),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'memberId': memberId,
      'amount': amount,
      'paymentDate': paymentDate.toIso8601String(),
      'paymentMethod': paymentMethod,
      'status': status.toString().split('.').last,
      'description': description,
    };
  }

  MembershipFeeModel copyWith({
    int? id,
    int? memberId,
    double? amount,
    DateTime? paymentDate,
    String? paymentMethod,
    PaymentStatus? status,
    String? description,
  }) {
    return MembershipFeeModel(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      status: status ?? this.status,
      description: description ?? this.description,
    );
  }


  static PaymentStatus statusFromString(String status) {
    switch (status) {
      case 'paid':
        return PaymentStatus.paid;
      case 'pending':
        return PaymentStatus.pending;
      case 'canceled':
        return PaymentStatus.canceled;
      default:
        throw Exception('Invalid PaymentStatus: $status');
    }
  }

  static String statusToString(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.paid:
        return 'paid';
      case PaymentStatus.pending:
        return 'pending';
      case PaymentStatus.canceled:
        return 'canceled';
    }
  }
}

