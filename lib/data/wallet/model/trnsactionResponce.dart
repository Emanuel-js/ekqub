import 'dart:convert';

class TransactionResponseModel {
  int? id;
  double? amount;
  int? senderAccount;
  int? receiverAccount;
  String? transactionDate;
  String? transactionType;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  TransactionResponseModel({
    this.id,
    this.amount,
    this.senderAccount,
    this.receiverAccount,
    this.transactionDate,
    this.transactionType,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
  });

  TransactionResponseModel copyWith({
    int? id,
    double? amount,
    int? senderAccount,
    int? receiverAccount,
    String? transactionDate,
    String? transactionType,
    String? createdBy,
    String? updatedBy,
    String? createdAt,
    String? updatedAt,
  }) {
    return TransactionResponseModel(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      senderAccount: senderAccount ?? this.senderAccount,
      receiverAccount: receiverAccount ?? this.receiverAccount,
      transactionDate: transactionDate ?? this.transactionDate,
      transactionType: transactionType ?? this.transactionType,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (senderAccount != null) {
      result.addAll({'senderAccount': senderAccount});
    }
    if (receiverAccount != null) {
      result.addAll({'receiverAccount': receiverAccount});
    }
    if (transactionDate != null) {
      result.addAll({'transactionDate': transactionDate});
    }
    if (transactionType != null) {
      result.addAll({'transactionType': transactionType});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }

    return result;
  }

  factory TransactionResponseModel.fromMap(Map<String, dynamic> map) {
    return TransactionResponseModel(
      id: map['id']?.toInt(),
      amount: map['amount']?.toDouble(),
      senderAccount: map['senderAccount']?.toInt(),
      receiverAccount: map['receiverAccount']?.toInt(),
      transactionDate: map['transactionDate'],
      transactionType: map['transactionType'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionResponseModel.fromJson(String source) =>
      TransactionResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TransactionResponseModel(id: $id, amount: $amount, senderAccount: $senderAccount, receiverAccount: $receiverAccount, transactionDate: $transactionDate, transactionType: $transactionType, createdBy: $createdBy, updatedBy: $updatedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionResponseModel &&
        other.id == id &&
        other.amount == amount &&
        other.senderAccount == senderAccount &&
        other.receiverAccount == receiverAccount &&
        other.transactionDate == transactionDate &&
        other.transactionType == transactionType &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        amount.hashCode ^
        senderAccount.hashCode ^
        receiverAccount.hashCode ^
        transactionDate.hashCode ^
        transactionType.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
