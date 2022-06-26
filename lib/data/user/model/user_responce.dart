//     final getProductsResponse = getProductsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:ekub/data/user/model/user.dart';

class UserResponse {
  UserResponse({
    this.success = false,
    this.message,
    this.statusCode,
    this.userInfo,
  });

  bool success = false;
  int? statusCode;
  String? message;
  List<UserModel>? userInfo;

  bool get isSuccess => success;

  UserResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : statusCode = statusCode,
        success = success,
        message = msg;

  factory UserResponse.fromRawJson(String str) =>
      UserResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        success: json["success"],
        userInfo: json["product_list"] == null
            ? null
            : List<UserModel>.from(
                json["product_list"].map((x) => UserModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "success": success,
        "product_list": userInfo == null
            ? null
            : List<dynamic>.from(userInfo!.map((x) => x.toJson())),
      };
}
