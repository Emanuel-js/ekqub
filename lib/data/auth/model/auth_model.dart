class AuthModel {
  String password;
  String userNameOrEmail;

  AuthModel({required this.password, required this.userNameOrEmail});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usernameOrEmail'] = userNameOrEmail;
    data['password'] = password;
    return data;
  }

  AuthModel.fromJson(Map<String, dynamic> data)
      : this(
          password: data['password'],
          userNameOrEmail: data['userNameOrEmail'],
        );
}
