import 'package:flutter/material.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      body: SingleChildScrollView(
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
              textAlign: TextAlign.start,
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(label: Text('Nome completo')),
            ),
            TextFormField(
              enabled: true,
              textAlign: TextAlign.start,
              autofocus: false,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(label: Text('E-mail')),
            ),
            TextFormField(
              enabled: true,
              textAlign: TextAlign.start,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Senha')),
            ),
            TextFormField(
              enabled: true,
              textAlign: TextAlign.start,
              autofocus: false,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration:
                  const InputDecoration(label: Text('Confirme a senha')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: AppButton(action: () {}, label: 'Cadastrar'),
            )
          ],
        ),
      )))),
    );
  }
}
