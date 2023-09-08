import 'package:flutter/material.dart';
import 'package:senai_mymoney_app/src/modules/home/components/expense_register_modal.dart';
import 'package:senai_mymoney_app/src/shared/components/app_modal.dart';

class ExpenseButton {
  static Widget? add(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        AppModal.show(
          context,
          const ExpenseRegisterModal(),
          expand: false,
        );
      },
      tooltip: 'Nova despesa',
      child: const Icon(Icons.paid, color: Colors.white, size: 45),
    );
  }
}
