import 'dart:convert';

import 'package:ekub/data/user/model/user.dart';
import 'package:ekub/data/user/model/user_account_model.dart';

class UserDetailModel {
  UserAccountModel? userAccount;
  UserModel? userProfile;
  UserDetailModel({
    this.userAccount,
    this.userProfile,
  });

  UserDetailModel copyWith({
    UserAccountModel? userAccount,
    UserModel? userProfile,
  }) {
    return UserDetailModel(
      userAccount: userAccount ?? this.userAccount,
      userProfile: userProfile ?? this.userProfile,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (userAccount != null) {
      result.addAll({'userAccount': userAccount!.toMap()});
    }
    if (userProfile != null) {
      result.addAll({'userProfile': userProfile!.toMap()});
    }

    return result;
  }

  factory UserDetailModel.fromMap(Map<String, dynamic> map) {
    return UserDetailModel(
      userAccount: map['userAccount'] != null
          ? UserAccountModel.fromMap(map['userAccount'])
          : null,
      userProfile: map['userProfile'] != null
          ? UserModel.fromMap(map['userProfile'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDetailModel.fromJson(String source) =>
      UserDetailModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserDetailModel(userAccount: $userAccount, userProfile: $userProfile)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserDetailModel &&
        other.userAccount == userAccount &&
        other.userProfile == userProfile;
  }

  @override
  int get hashCode => userAccount.hashCode ^ userProfile.hashCode;
}
