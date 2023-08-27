class SignupDataModel {
  String fullName;
  String email;
  String password;
  String roles;

  SignupDataModel({
    required this.fullName,
    required this.email,
    required this.password,
    this.roles = "user",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['roles'] = roles;

    return data;
  }
}
