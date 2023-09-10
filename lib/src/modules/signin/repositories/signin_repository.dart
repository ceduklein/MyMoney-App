import 'package:dio/dio.dart';
import 'package:senai_mymoney_app/src/http/app_dio.dart';
import 'package:senai_mymoney_app/src/modules/signin/model/signin_model.dart';

class SignInRepository {
  String baseURL = "http://192.168.68.111:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(
      SignInModel signInData) async {
    Dio clientHTTP = await AppDio.getConnection(isAuth: false);

    return clientHTTP.post(baseURL, data: signInData.toJson());
  }

  Future<Response<dynamic>> getGoal(String userId) async {
    String url = "http://192.168.68.111:3099/goal/findByUser/$userId";

    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.get(url);
  }
}
