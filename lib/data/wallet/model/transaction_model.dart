import 'dart:convert';

class TransactionModel {
  double? amount;
  String? senderAccount;
  String? receiverAccount;
  TransactionModel({
    this.amount,
    this.senderAccount,
    this.receiverAccount,
  });

  TransactionModel copyWith({
    double? amount,
    String? senderAccount,
    String? receiverAccount,
  }) {
    return TransactionModel(
      amount: amount ?? this.amount,
      senderAccount: senderAccount ?? this.senderAccount,
      receiverAccount: receiverAccount ?? this.receiverAccount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (senderAccount != null) {
      result.addAll({'senderAccount': senderAccount});
    }
    if (receiverAccount != null) {
      result.addAll({'receiverAccount': receiverAccount});
    }

    return result;
  }

  Map<String, dynamic> toMapTopUp() {
    final result = <String, dynamic>{};

    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (receiverAccount != null) {
      result.addAll({'receiverAccount': receiverAccount});
    }

    return result;
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      amount: map['amount']?.toDouble(),
      senderAccount: map['senderAccount'],
      receiverAccount: map['receiverAccount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'TransactionModel(amount: $amount, senderAccount: $senderAccount, receiverAccount: $receiverAccount)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransactionModel &&
        other.amount == amount &&
        other.senderAccount == senderAccount &&
        other.receiverAccount == receiverAccount;
  }

  @override
  int get hashCode =>
      amount.hashCode ^ senderAccount.hashCode ^ receiverAccount.hashCode;
}
