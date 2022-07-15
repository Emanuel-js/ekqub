import 'dart:developer';

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
  UserModel? userProfile;
  RoleModel? role;
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
    this.userProfile,
    this.role,
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
    if (userProfile != null) {
      result.addAll({'userProfile': userProfile!.toMap()});
    }
    if (role != null) {
      result.addAll({'role': role!.toMap()});
    }

    return result;
  }

  UserDetailModel.fromMap(Map<String, dynamic> map) {
    log("inside user detail model from map");
    createdAt = map['createdAt'];
    updatedAt = map['updatedAt'];
    createdBy = map['createdBy'];
    updatedBy = map['updatedBy'];
    id = map['id'];
    username = map['username'];
    email = map['email'];
    lockTime = map['lockTime'];
    failedAttempt = map['failedAttempt'];
    accountNonLocked = map['accountNonLocked'];

    userProfile = UserModel.fromMap(map['userProfile']);
    // log("User profile is $userProfile");
    role = RoleModel.fromMap(map['role']);
    log("role is $role");
    // return UserDetailModel(
    //   createdAt: map['createdAt'],
    //   updatedAt: map['updatedAt'],
    //   createdBy: map['createdBy'],
    //   updatedBy: map['updatedBy'],
    //   id: int.parse(map['id']),
    //   username: map['username'],
    //   email: map['email'],
    //   lockTime: map['lockTime'],
    //   failedAttempt: map['failedAttempt'],
    //   accountNonLocked: map['accountNonLocked'],
    //   userProfile: UserModel.fromMap(map['userProfile']),
    //   role: RoleModel.fromMap(map['role']),
    // );
  }
}
