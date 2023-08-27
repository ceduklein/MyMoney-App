class UserModel {
  String fullName;
  String email;
  String id;
  double? limitValue;

  UserModel({
    required this.fullName,
    required this.email,
    required this.id,
    this.limitValue,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['fullName'] = fullName;
    data['email'] = email;
    data['id'] = id;
    data['limitValue'] = limitValue;

    return data;
  }
}
