import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:senai_mymoney_app/src/modules/signin/components/register_link.dart';
import 'package:senai_mymoney_app/src/modules/signin/controller/signin_controller.dart';
import 'package:senai_mymoney_app/src/router/app_router.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_loading.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  SigninController controller = SigninController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactsToSendDataSuccess();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void reactsToSendDataSuccess() {
    sendDataReactionDisposer =
        reaction((_) => controller.isSuccess, (bool success) async {
      if (success) {
        controller.setSucess();
        await controller.verifyFirstAcess();

        controller.isFirstAcess
            ? await Navigator.of(context).pushNamed(AppRouter.personalRegister)
            : await Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRouter.home, (route) => false);

        controller.setLoading();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return controller.isLoading
          ? const AppLoading()
          : Scaffold(
              backgroundColor: AppColors.appPageBackground,
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 140,
                      left: 25,
                      right: 25,
                    ),
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AppLogoTitle(
                            title: 'Login My Money',
                            iconSize: 80,
                            titleSize: 20,
                          ),
                          TextFormField(
                            enabled: true,
                            controller: loginController,
                            textAlign: TextAlign.start,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            decoration:
                                const InputDecoration(label: Text('Login')),
                          ),
                          TextFormField(
                            enabled: true,
                            controller: passwordController,
                            textAlign: TextAlign.start,
                            autofocus: false,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration:
                                const InputDecoration(label: Text('Senha')),
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 10),
                              child: AppButton(
                                  action: () {
                                    controller.checkData(
                                      emailController: loginController.text,
                                      passwordController:
                                          passwordController.text,
                                      buildContext: context,
                                    );
                                  },
                                  label: "Login")),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouter.signup);
                              },
                              child: const RegisterLink()),
                        ]),
                  ),
                )),
              ));
    });
  }
}
