import 'dart:convert';
import 'package:senai_mymoney_app/src/shared/model/user_model.dart';
import 'package:senai_mymoney_app/src/shared/storage/app_keys.dart';
import 'package:senai_mymoney_app/src/shared/storage/app_secure_storage.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    Map<String, dynamic> userJson = {};

    String? user = await AppSecureStorage.readItem(AppKeys.user);

    if (user != null) userJson.addAll(jsonDecode(user));

    String goalValue =
        await AppSecureStorage.readItem(AppKeys.goal_value) ?? "0";

    userJson["limitValue"] = goalValue;

    UserModel userData = UserModel.fromJson(userJson);

    return userData;
  }
}
