// ignore_for_file: public_member_api_docs, sort_constructors_first

class RefundResponseModel {
  int? userId;
  String? fullName;
  String? reason;
  double? amount;
  String? bankAccountNumber;
  String? phoneForBankAccountNumber;
  String? bankName;
  String? refundMeStatus;
  String? refundUniqueId;
  String? createdAt;
  String? updatedAt;
  String? approvedBy;
  RefundResponseModel(
      {this.userId,
      this.fullName,
      this.reason,
      this.amount,
      this.bankAccountNumber,
      this.phoneForBankAccountNumber,
      this.bankName,
      this.refundMeStatus,
      this.createdAt,
      this.updatedAt,
      this.approvedBy,
      this.refundUniqueId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'fullName': fullName,
      'reason': reason,
      'amount': amount,
      'bankAccountNumber': bankAccountNumber,
      'phoneForBankAccountNumber': phoneForBankAccountNumber,
      'bankName': bankName,
      'refundMeStatus': refundMeStatus,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'approvedBy': approvedBy,
      'refundUniqueId': refundUniqueId
    };
  }

  RefundResponseModel.fromMap(Map<String, dynamic> map) {
    userId = map['userId'];
    fullName = map['fullName'];
    reason = map['reason'];
    amount = map['amount'];
    bankAccountNumber = map['bankAccountNumber'];
    phoneForBankAccountNumber = map['phoneForBankAccountNumber'];
    bankName = map['bankName'];
    refundMeStatus = map['refundMeStatus'];
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
    approvedBy = map['approvedBy'];
    refundUniqueId = map['refundUniqueId'];
  }
}
