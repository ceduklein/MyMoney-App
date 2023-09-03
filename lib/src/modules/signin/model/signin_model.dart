class SignInModel {
  String username;
  String password;

  SignInModel({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data["username"] = username;
    data["password"] = password;

    return data;
  }
}
