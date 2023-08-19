import 'package:flutter/services.dart';

extension TextInputFormatterExtension on TextInputFormatter {
  String formatText(String text) {
    return formatEditUpdate(
      const TextEditingValue(),
      TextEditingValue(
        text: text,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length,
        ),
      ),
    ).text;
  }
}
