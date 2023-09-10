import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:senai_mymoney_app/src/modules/personal_register/controller/personal_register_controller.dart';
import 'package:senai_mymoney_app/src/router/app_router.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_loading.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';

class PersonalRegisterPage extends StatefulWidget {
  const PersonalRegisterPage({super.key});

  @override
  State<PersonalRegisterPage> createState() => _PersonalRegisterPageState();
}

class _PersonalRegisterPageState extends State<PersonalRegisterPage> {
  PersonalRegisterController controller = PersonalRegisterController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController limitValueController = TextEditingController();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void initState() {
    super.initState();
    controller.loadUser().then((user) {
      fullNameController.text = user.fullName;
      emailController.text = user.email;
      limitValueController.text = user.limitValue.toString();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactsToSendDataSuccess();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    limitValueController.dispose();
    sendDataReactionDisposer();
    super.dispose();
  }

  void reactsToSendDataSuccess() {
    sendDataReactionDisposer =
        reaction((_) => controller.isSuccess, (bool success) {
      if (success) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(AppRouter.home, (route) => false);

        controller.isLoading = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appPageBackground,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.logo),
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
                                title: 'Meus dados',
                                titleSize: 20,
                                iconSize: 80,
                              ),
                              TextFormField(
                                enabled: true,
                                controller: fullNameController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType: TextInputType.text,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
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
                                    label: Text("E-mail")),
                              ),
                              TextFormField(
                                enabled: true,
                                controller: limitValueController,
                                textAlign: TextAlign.start,
                                autofocus: false,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                decoration: const InputDecoration(
                                    label: Text("Limite de gastos")),
                              ),
                              limitValueController.text == '0.0'
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFE0E0E0),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Informe seu limite de gastos",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: AppButton(
                                    action: () async {
                                      await controller.checkData(
                                        buildContext: context,
                                        nameController: fullNameController.text,
                                        emailController: emailController.text,
                                        limitValueController:
                                            limitValueController.text,
                                      );
                                    },
                                    label: "Enviar dados"),
                              ),
                            ],
                          )),
                    ),
                  ),
                );
        }));
  }
}
