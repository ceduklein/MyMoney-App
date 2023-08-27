import 'package:flutter/material.dart';
import 'package:senai_mymoney_app/src/modules/initial/page/initial_page.dart';
import 'package:senai_mymoney_app/src/modules/personal_register/page/personal_register.dart';
import 'package:senai_mymoney_app/src/modules/signin/page/signin_page.dart';
import 'package:senai_mymoney_app/src/modules/signup/page/signup_page.dart';
import 'package:senai_mymoney_app/src/router/app_router.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Money',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const InitialPage(),
      darkTheme: ThemeData.dark(),
      routes: {
        AppRouter.login: (context) => const SignInPage(),
        AppRouter.signup: (context) => const SignUpPage(),
        AppRouter.personalRegister: (context) => const PersonalRegisterPage(),
      },
    );
  }
}
