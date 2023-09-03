import 'package:dio/dio.dart';
import 'package:senai_mymoney_app/src/http/app_dio.dart';
import 'package:senai_mymoney_app/src/modules/signup/model/signup_data_model.dart';

class SignupRepository {
  String baseURL = "http://192.168.68.102:3099/user";

  Future<Response<Map<String, dynamic>>> sendSignupData(
      SignupDataModel signupData) async {
    final Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return clientHTTP.post('$baseURL/create', data: signupData.toJson());
  }
}
