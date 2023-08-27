import 'package:senai_mymoney_app/src/shared/model/user_model.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    UserModel userData = UserModel(fullName: "", email: "", id: "");

    return userData;
  }
}
