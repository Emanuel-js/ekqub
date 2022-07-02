import 'dart:convert';

class SavingAccountModel {
  int? id;
  int? user;
  double? balance;
  SavingAccountModel({
    this.id,
    this.user,
    this.balance,
  });

  SavingAccountModel copyWith({
    int? id,
    int? user,
    double? balance,
  }) {
    return SavingAccountModel(
      id: id ?? this.id,
      user: user ?? this.user,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    if (user != null) {
      result.addAll({'user': user});
    }
    if (balance != null) {
      result.addAll({'balance': balance});
    }

    return result;
  }

  factory SavingAccountModel.fromMap(Map<String, dynamic> map) {
    return SavingAccountModel(
      id: map['id']?.toInt(),
      user: map['user']?.toInt(),
      balance: map['balance']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory SavingAccountModel.fromJson(String source) =>
      SavingAccountModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'SavingAccountModel(id: $id, user: $user, balance: $balance)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SavingAccountModel &&
        other.id == id &&
        other.user == user &&
        other.balance == balance;
  }

  @override
  int get hashCode => id.hashCode ^ user.hashCode ^ balance.hashCode;
}
