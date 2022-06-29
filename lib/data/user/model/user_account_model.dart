import 'dart:convert';

class UserAccountModel {
  String? username;
  String? email;
  String? lockTime;
  String? failedAttempt;
  bool? accountNonLocked;
  String? createdBy;
  UserAccountModel({
    this.username,
    this.email,
    this.lockTime,
    this.failedAttempt,
    this.accountNonLocked,
    this.createdBy,
  });

  UserAccountModel copyWith({
    String? username,
    String? email,
    String? lockTime,
    String? failedAttempt,
    bool? accountNonLocked,
    String? createdBy,
  }) {
    return UserAccountModel(
      username: username ?? this.username,
      email: email ?? this.email,
      lockTime: lockTime ?? this.lockTime,
      failedAttempt: failedAttempt ?? this.failedAttempt,
      accountNonLocked: accountNonLocked ?? this.accountNonLocked,
      createdBy: createdBy ?? this.createdBy,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (username != null) {
      result.addAll({'username': username});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (lockTime != null) {
      result.addAll({'lockTime': lockTime});
    }
    if (failedAttempt != null) {
      result.addAll({'failedAttempt': failedAttempt});
    }
    if (accountNonLocked != null) {
      result.addAll({'accountNonLocked': accountNonLocked});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }

    return result;
  }

  factory UserAccountModel.fromMap(Map<String, dynamic> map) {
    return UserAccountModel(
      username: map['username'],
      email: map['email'],
      lockTime: map['lockTime'],
      failedAttempt: map['failedAttempt'],
      accountNonLocked: map['accountNonLocked'],
      createdBy: map['createdBy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccountModel.fromJson(String source) =>
      UserAccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserAccountModel(username: $username, email: $email, lockTime: $lockTime, failedAttempt: $failedAttempt, accountNonLocked: $accountNonLocked, createdBy: $createdBy)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserAccountModel &&
        other.username == username &&
        other.email == email &&
        other.lockTime == lockTime &&
        other.failedAttempt == failedAttempt &&
        other.accountNonLocked == accountNonLocked &&
        other.createdBy == createdBy;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        email.hashCode ^
        lockTime.hashCode ^
        failedAttempt.hashCode ^
        accountNonLocked.hashCode ^
        createdBy.hashCode;
  }
}
