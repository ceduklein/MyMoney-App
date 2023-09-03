import 'package:dio/dio.dart';
import 'package:senai_mymoney_app/src/http/app_dio.dart';
import 'package:senai_mymoney_app/src/modules/personal_register/model/personal_register_model.dart';
import 'package:senai_mymoney_app/src/shared/model/user_update_model.dart';

class PersonalRegisterRepository {
  Future<Response<Map<String, dynamic>>> sendData(
      PersonalRegisterModel personalRegisterData) async {
    String url = "http://localhost:3099/goal/create";

    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return clientHTTP.post(url, data: personalRegisterData.toJson());
  }

  Future<Response<Map<String, dynamic>>> updateDataUser(
      String userId, UserUpdateModel userUpdate) async {
    String url = "http://192.168.68.102:3099/user/update/$userId";

    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return clientHTTP.patch(url, data: userUpdate.toJson());
  }
}
