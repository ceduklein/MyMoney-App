import 'package:senai_mymoney_app/src/shared/model/user_connect_model.dart';

class PersonalRegisterModel {
  String userId;
  double limitValue;

  PersonalRegisterModel({
    required this.userId,
    required this.limitValue,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    Map<String, dynamic> userConnect =
        UserConnectModel(userId: userId).toJson();

    data["user"] = userConnect;
    data["limitValue"] = limitValue;

    return data;
  }
}
