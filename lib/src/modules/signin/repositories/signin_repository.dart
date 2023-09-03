import 'package:dio/dio.dart';
import 'package:senai_mymoney_app/src/http/app_dio.dart';
import 'package:senai_mymoney_app/src/modules/signin/model/signin_model.dart';

class SignInRepository {
  String baseURL = "http://1192.168.68.102:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(
      SignInModel signInData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: false);

    return clientHTTP.post(baseURL, data: signInData.toJson());
  }
}
