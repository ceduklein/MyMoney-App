class UserModel {
  late String fullName;
  late String email;
  late String id;
  late double? limitValue;

  UserModel({
    required this.fullName,
    required this.email,
    required this.id,
    this.limitValue,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    print("fromJson - json: ${json.toString()}");

    fullName = json["fullName"];
    email = json["email"];
    id = json["id"];
    limitValue = double.parse(json["limitValue"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['fullName'] = fullName;
    data['email'] = email;
    data['id'] = id;
    data['limitValue'] = limitValue;

    return data;
  }
}
