import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:senai_mymoney_app/src/modules/signup/controller/signup_controller.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_loading.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignupController controller = SignupController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactsToSendDataSuccess();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    sendDataReactionDisposer();
    super.dispose();
  }

  void reactsToSendDataSuccess() {
    sendDataReactionDisposer =
        reaction((_) => controller.isSuccess, (bool success) {
      if (success) Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appPageBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: AppColors.appPageBackground,
        body: Observer(builder: (_) {
          return controller.isLoading
              ? const AppLoading()
              : SingleChildScrollView(
                  child: SafeArea(
                    child: Center(
                      child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 25,
                            right: 25,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const AppLogoTitle(
                                title: 'Cadastro My Money',
                                titleSize: 20,
                                iconSize: 80,
                              ),
                              TextFormField(
                                enabled: true,
                                controller: nameController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                decoration: const InputDecoration(
                                    label: Text("Nome completo")),
                              ),
                              TextFormField(
                                  enabled: true,
                                  controller: emailController,
                                  textAlign: TextAlign.start,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                      label: Text("E-mail"))),
                              TextFormField(
                                  enabled: true,
                                  controller: passwordController,
                                  textAlign: TextAlign.start,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      label: Text("Senha"))),
                              TextFormField(
                                  enabled: true,
                                  controller: passwordCheckController,
                                  textAlign: TextAlign.start,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      label: Text("Confirme a senha"))),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: AppButton(
                                    action: () async {
                                      await controller.checkData(
                                        buildContext: context,
                                        nameController: nameController.text,
                                        emailController: emailController.text,
                                        passwordController:
                                            passwordController.text,
                                        passwordCheckController:
                                            passwordCheckController.text,
                                      );
                                    },
                                    label: "Cadastrar"),
                              )
                            ],
                          )),
                    ),
                  ),
                );
        }));
  }
}
