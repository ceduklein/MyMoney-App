class UserUpdateModel {
  String fullName;
  String email;

  UserUpdateModel({
    required this.fullName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['fullName'] = fullName;
    data['email'] = email;

    return data;
  }
}
