import 'dart:convert';

class RefundModel {
  int userId;
  String fullName;
  String reason;
  double amount;
  String bankAccountNumber;
  String phoneForBankAccountNumber;
  String bankName;
  String? refundMeStatus;
  String? createdAt;
  String? updatedAt;
  RefundModel({
    required this.userId,
    required this.fullName,
    required this.reason,
    required this.amount,
    required this.bankAccountNumber,
    required this.phoneForBankAccountNumber,
    required this.bankName,
    this.refundMeStatus,
    this.createdAt,
    this.updatedAt,
  });

  RefundModel copyWith({
    int? userId,
    String? fullName,
    String? reason,
    double? amount,
    String? bankAccountNumber,
    String? phoneForBankAccountNumber,
    String? bankName,
    String? refundMeStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    return RefundModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      reason: reason ?? this.reason,
      amount: amount ?? this.amount,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      phoneForBankAccountNumber:
          phoneForBankAccountNumber ?? this.phoneForBankAccountNumber,
      bankName: bankName ?? this.bankName,
      refundMeStatus: refundMeStatus ?? this.refundMeStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'fullName': fullName});
    result.addAll({'reason': reason});
    result.addAll({'amount': amount});
    result.addAll({'bankAccountNumber': bankAccountNumber});
    result.addAll({'phoneForBankAccountNumber': phoneForBankAccountNumber});
    result.addAll({'bankName': bankName});

    return result;
  }

  factory RefundModel.fromMap(Map<String, dynamic> map) {
    return RefundModel(
      userId: map['userId']?.toInt() ?? 0,
      fullName: map['fullName'] ?? '',
      reason: map['reason'] ?? '',
      amount: map['amount'] ?? '',
      bankAccountNumber: map['bankAccountNumber'] ?? '',
      phoneForBankAccountNumber: map['phoneForBankAccountNumber'] ?? '',
      bankName: map['bankName'] ?? '',
      refundMeStatus: map['refundMeStatus'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RefundModel.fromJson(String source) =>
      RefundModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RefundModel(userId: $userId, fullName: $fullName, reason: $reason, amount: $amount, bankAccountNumber: $bankAccountNumber, phoneForBankAccountNumber: $phoneForBankAccountNumber, bankName: $bankName, refundMeStatus: $refundMeStatus, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RefundModel &&
        other.userId == userId &&
        other.fullName == fullName &&
        other.reason == reason &&
        other.amount == amount &&
        other.bankAccountNumber == bankAccountNumber &&
        other.phoneForBankAccountNumber == phoneForBankAccountNumber &&
        other.bankName == bankName &&
        other.refundMeStatus == refundMeStatus &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        fullName.hashCode ^
        reason.hashCode ^
        amount.hashCode ^
        bankAccountNumber.hashCode ^
        phoneForBankAccountNumber.hashCode ^
        bankName.hashCode ^
        refundMeStatus.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
