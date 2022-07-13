import 'dart:convert';

import 'package:ekub/data/user/model/role_model.dart';
import 'package:ekub/data/user/model/user.dart';

class UserDetailModel {
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? id;
  String? username;
  String? email;
  String? lockTime;
  int? failedAttempt;
  bool? accountNonLocked;
  UserModel userProfile;
  RoleModel role;
  UserDetailModel({
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.id,
    this.username,
    this.email,
    this.lockTime,
    this.failedAttempt,
    this.accountNonLocked,
    required this.userProfile,
    required this.role,
  });

  UserDetailModel copyWith({
    String? createdAt,
    String? updatedAt,
    String? createdBy,
    String? updatedBy,
    int? id,
    String? username,
    String? email,
    String? lockTime,
    int? failedAttempt,
    bool? accountNonLocked,
    UserModel? userProfile,
    RoleModel? role,
  }) {
    return UserDetailModel(
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      lockTime: lockTime ?? this.lockTime,
      failedAttempt: failedAttempt ?? this.failedAttempt,
      accountNonLocked: accountNonLocked ?? this.accountNonLocked,
      userProfile: userProfile ?? this.userProfile,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (createdAt != null) {
      result.addAll({'createdAt': createdAt});
    }
    if (updatedAt != null) {
      result.addAll({'updatedAt': updatedAt});
    }
    if (createdBy != null) {
      result.addAll({'createdBy': createdBy});
    }
    if (updatedBy != null) {
      result.addAll({'updatedBy': updatedBy});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
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
    result.addAll({'userProfile': userProfile.toMap()});
    result.addAll({'role': role.toMap()});

    return result;
  }

  factory UserDetailModel.fromMap(Map<String, dynamic> map) {
    return UserDetailModel(
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
      createdBy: map['createdBy'],
      updatedBy: map['updatedBy'],
      id: map['id']?.toInt(),
      username: map['username'],
      email: map['email'],
      lockTime: map['lockTime'],
      failedAttempt: map['failedAttempt']?.toInt(),
      accountNonLocked: map['accountNonLocked'],
      userProfile: UserModel.fromMap(map['userProfile']),
      role: RoleModel.fromMap(map['role']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetailModel.fromJson(String source) =>
      UserDetailModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserDetailModel(createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy, id: $id, username: $username, email: $email, lockTime: $lockTime, failedAttempt: $failedAttempt, accountNonLocked: $accountNonLocked, userProfile: $userProfile, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetailModel &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.createdBy == createdBy &&
        other.updatedBy == updatedBy &&
        other.id == id &&
        other.username == username &&
        other.email == email &&
        other.lockTime == lockTime &&
        other.failedAttempt == failedAttempt &&
        other.accountNonLocked == accountNonLocked &&
        other.userProfile == userProfile &&
        other.role == role;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        updatedAt.hashCode ^
        createdBy.hashCode ^
        updatedBy.hashCode ^
        id.hashCode ^
        username.hashCode ^
        email.hashCode ^
        lockTime.hashCode ^
        failedAttempt.hashCode ^
        accountNonLocked.hashCode ^
        userProfile.hashCode ^
        role.hashCode;
  }
}
