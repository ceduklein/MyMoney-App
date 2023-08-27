import 'package:flutter/foundation.dart';
import 'package:senai_mymoney_app/src/modules/signup/model/signup_data_model.dart';
import 'package:senai_mymoney_app/src/modules/signup/repositories/signup_repository.dart';

class SignupService {
  final SignupRepository repository = SignupRepository();

  Future<bool> sendSignupData(
    String name,
    String email,
    String password,
  ) async {
    try {
      SignupDataModel signupData = SignupDataModel(
        fullName: name,
        email: email,
        password: password,
      );

      await repository.sendSignupData(signupData);
      return true;
    } catch (exception) {
      debugPrint(exception.toString());
      return false;
    }
  }
}
