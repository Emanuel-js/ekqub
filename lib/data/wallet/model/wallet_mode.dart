import 'dart:convert';

class WalletModel {
  String? createdBy;
  String? updatedBy;
  int? id;
  int? userId;
  String? account;
  double? balance;
  bool? active;
  WalletModel({
    this.createdBy,
    this.updatedBy,
    this.id,
    this.userId,
    this.account,
    this.balance,
    this.active,
  });

  WalletModel copyWith({
    String? createdBy,
    String? updatedBy,
    int? id,
    int? userId,
    String? account,
    double? balance,
    bool? active,
  }) {
    return WalletModel(
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      account: account ?? this.account,
      balance: balance ?? this.balance,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (account != null) {
      result.addAll({'account': account});
    }
    if (balance != null) {
      result.addAll({'balance': balance});
    }
    if (active != null) {
      result.addAll({'active': active});
    }

    return result;
  }

  factory WalletModel.fromMap(Map<String, dynamic> map) {
    return WalletModel(
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      id: map['id'],
      userId: map['userId'],
      account: map['account'],
      balance: map['balance'],
      active: map['active'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WalletModel.fromJson(String source) =>
      WalletModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WalletModel(createdBy: $createdBy, updatedBy: $updatedBy, id: $id, userId: $userId, account: $account, balance: $balance, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WalletModel &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.id == id &&
        other.userId == userId &&
        other.account == account &&
        other.balance == balance &&
        other.active == active;
  }

  @override
  int get hashCode {
    return createdBy.hashCode ^
        updatedBy.hashCode ^
        id.hashCode ^
        userId.hashCode ^
        account.hashCode ^
        balance.hashCode ^
        active.hashCode;
  }
}
