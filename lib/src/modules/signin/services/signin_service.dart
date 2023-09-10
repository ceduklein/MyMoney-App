import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:senai_mymoney_app/src/modules/signin/model/signin_model.dart';
import 'package:senai_mymoney_app/src/modules/signin/repositories/signin_repository.dart';
import 'package:senai_mymoney_app/src/shared/storage/app_secure_storage.dart';
import 'package:senai_mymoney_app/src/shared/storage/app_keys.dart';

class SignInService {
  SignInRepository repository = SignInRepository();

  Future<Map<dynamic, dynamic>> sendData({
    required String username,
    required String password,
  }) async {
    try {
      SignInModel signInData = SignInModel(
        username: username,
        password: password,
      );

      await persistLocalData(
        await repository.sendData(signInData),
      );

      return {"success": true};
    } on DioError catch (exception) {
      return {"exception": sendException(exception)};
    }
  }

  Future<void> persistLocalData(Response<Map<String, dynamic>> response) async {
    Map<String, dynamic>? result = response.data;

    if (result != null) {
      String token = result['access_token'];
      Map<String, dynamic> userData = result['additional_information'];
      String userId = userData['id'];

      AppSecureStorage.addItem(AppKeys.auth_token, token);
      AppSecureStorage.addItem(AppKeys.user, jsonEncode(userData));
      AppSecureStorage.addItem(AppKeys.user_id, userId);
    }
  }

  int sendException(Object error) {
    final DioError errorResult = error as DioError;
    return errorResult.response!.data['statusCode'];
  }

  Future<bool> verifyFirstAcess() async {
    String? userId = await AppSecureStorage.readItem(AppKeys.user_id);

    Response response = await repository.getGoal(userId!);

    return response.data == '';
  }
}
