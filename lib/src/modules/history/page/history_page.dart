import 'package:flutter/material.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_logo_title.dart';
import 'package:senai_mymoney_app/src/shared/components/expense_list.dart';
import 'package:senai_mymoney_app/src/shared/model/expense_model.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as Map<String, List<ExpenseModel>>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appPageBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.logo,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.appPageBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppLogoTitle(
                      title: 'Histórico de gastos',
                      titleSize: 20,
                      iconSize: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ExpenseList(
                        expenses: args["expenses"]!,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
