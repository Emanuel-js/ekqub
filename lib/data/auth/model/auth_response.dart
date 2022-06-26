class AuthResponse {
  AuthResponse(
      {this.accessToken, this.roles, this.success = false, this.message});

  String? accessToken;
  String? message;
  String? roles;
  bool success = false;

  bool get isSuccess => success;

  AuthResponse.withError({bool success = false, String? msg})
      : success = success,
        message = msg;

  AuthResponse.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"],
        roles = json["roles"];

  Map<String, dynamic> toJson() => {
        'roles': roles,
        'accessToken': accessToken,
      };
}
