import 'package:flutter/material.dart';

class AppSnackbar {
  static void openMessage({
    required BuildContext context,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 4),
        backgroundColor: Colors.green,
        elevation: 50,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        content: Text(
          message,
        )));
  }
}
