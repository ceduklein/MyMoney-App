import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:senai_mymoney_app/src/modules/signup/service/signup_service.dart';
import 'package:senai_mymoney_app/src/shared/components/app_snackbar.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupController with _$SignupController;

abstract class _SignupController with Store {
  SignupService service = SignupService();

  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  late String name;
  late String email;
  late String password;
  late BuildContext buildContext;

  @action
  Future<void> checkData({
    required String nameController,
    required String emailController,
    required String passwordController,
    required String passwordCheckController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;
    if (passwordController.compareTo(passwordCheckController) == 0) {
      name = nameController;
      email = emailController;
      password = passwordController;
      await validate();
    } else {
      AppSnackbar.openMessage(
          context: buildContext,
          message: "A confirmação da senha está incorreta.");
    }
  }

  @action
  Future<void> senData() async {
    isSuccess = await service.sendSignupData(
      name,
      email,
      password,
    );
    if (isSuccess) {
      AppSnackbar.openMessage(
          context: buildContext, message: "Cadastro realizado com sucesso.");
    }
  }

  @action
  Future<void> validate() async {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      isLoading = true;
      await senData();
      isLoading = false;
    } else {
      AppSnackbar.openMessage(
          context: buildContext,
          message: "Todos os campos devem ser preenchidos.");
    }
  }
}
