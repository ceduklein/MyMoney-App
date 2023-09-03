import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:senai_mymoney_app/src/modules/signin/services/signin_service.dart';
import 'package:senai_mymoney_app/src/shared/components/app_snackbar.dart';
import 'package:senai_mymoney_app/src/shared/helpers/validator.dart';
part 'signin_controller.g.dart';

class SigninController = _SigninController with _$SigninController;

abstract class _SigninController with Store {
  SignInService service = SignInService();

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  late String email;
  late String password;
  late BuildContext buildContext;

  @action
  Future<void> checkData({
    required String emailController,
    required String passwordController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;
    if (_validate(
        emailController: emailController,
        passwordController: passwordController)) {
      email = emailController;
      password = passwordController;
      setLoading();
      await sendData();
    } else {
      AppSnackbar.openMessage(
        context: buildContext,
        message: "Verifique os dados preenchidos",
      );
    }
  }

  bool _validate({
    required String emailController,
    required String passwordController,
  }) {
    return (Validator.isEmail(emailController) &&
        passwordController.isNotEmpty);
  }

  @action
  Future<void> sendData() async {
    Map result = await service.sendData(
      username: email,
      password: password,
    );

    result.containsKey('success')
        ? setSucess()
        : getException(result['exception']);
  }

  @action
  void setSucess({bool? value}) => isSuccess = value ?? !isSuccess;

  @action
  void setLoading({bool? value}) => isLoading = value ?? !isLoading;

  @action
  void getException(int code) {
    setLoading();
    switch (code) {
      case 401:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Acesso não autorizado",
        );
        break;
      case 400:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Dados inválidos",
        );
        break;
      default:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Erro inesperado, tente mais tarde",
        );
    }
  }
}
