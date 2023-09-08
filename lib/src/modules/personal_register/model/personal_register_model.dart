import 'package:senai_mymoney_app/src/shared/model/user_connect_model.dart';

class PersonalRegisterModel {
  late String userId;
  late double limitValue;

  PersonalRegisterModel({
    required this.userId,
    required this.limitValue,
  });

  PersonalRegisterModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    limitValue = json['limitValue'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    Map<String, dynamic> userConnect =
        UserConnectModel(userId: userId).toJson();

    data["user"] = userConnect;
    data["limitValue"] = limitValue;

    return data;
  }
}
