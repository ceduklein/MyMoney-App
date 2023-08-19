import 'package:flutter/material.dart';
import 'package:senai_mymoney_app/src/modules/signin/components/register_link.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(242, 242, 242, 242),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 140, left: 25, right: 25),
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
                decoration: const InputDecoration(label: Text('Usuário')),
              ),
              TextFormField(
                enabled: true,
                controller: passwordController,
                textAlign: TextAlign.start,
                autofocus: false,
                obscureText: true,
                decoration: const InputDecoration(label: Text('Senha')),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: AppButton(action: () {}, label: 'Acessar')),
              GestureDetector(
                onTap: () {},
                child: const RegisterLink(),
              )
            ],
          ),
        ),
      ))),
    );
  }
}
