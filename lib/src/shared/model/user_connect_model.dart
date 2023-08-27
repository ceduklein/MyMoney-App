class UserConnectModel {
  String userId;

  UserConnectModel({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    final Map<String, String> connectId = <String, String>{};

    connectId["id"] = userId;
    data["connect"] = connectId;

    return data;
  }
}
