class RefundModel {
  int userId;
  String fullName;
  String reason;
  String amount;
  String bankAccountNumber;
  String phoneForBankAccountNumber;
  String bankName;
  RefundModel({
    required this.userId,
    required this.fullName,
    required this.reason,
    required this.amount,
    required this.bankAccountNumber,
    required this.phoneForBankAccountNumber,
    required this.bankName,
  });

  RefundModel copyWith({
    int? userId,
    String? fullName,
    String? reason,
    String? amount,
    String? bankAccountNumber,
    String? phoneForBankAccountNumber,
    String? bankName,
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
    );
  }
}
