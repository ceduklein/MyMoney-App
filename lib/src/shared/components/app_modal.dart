import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AppModal {
  static void show(BuildContext context, Widget child, {bool expand = true}) {
    showCupertinoModalBottomSheet<dynamic>(
        enableDrag: true,
        expand: expand,
        barrierColor: const Color(0x70000000),
        builder: (BuildContext context) {
          return child;
        },
        context: context);
  }
}
