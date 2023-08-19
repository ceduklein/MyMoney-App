import 'package:flutter/services.dart';
import 'package:senai_mymoney_app/src/shared/extensions/string_extension.dart';

class InputMask {
  static TextInputFormatter get moneyFormatter {
    return MoneyFormatter();
  }
}

class UtilFormatter {
  static String formatDecimal({
    required String decimalSeparator,
    required String thousandSeparator,
    required String leftSymbol,
    required String rightSymbol,
    required String value,
    int? maxLength,
  }) {
    value = value.onlyNumber().trimLeftZeros();

    if (maxLength != null && value.length > maxLength) {
      value = value.substring(0, maxLength);
    }

    while (value.length < 3) {
      value = '0$value';
    }

    final String right = value.substring(value.length - 2);
    final String left = value.substring(0, value.length - 2);

    int index = left.length;
    String maskedLeft = '';

    while (index > 3) {
      maskedLeft = '.${left.substring(index - 3, index)}$maskedLeft';
      index = index - 3;
    }

    maskedLeft = left.substring(0, index) + maskedLeft;

    value = '$maskedLeft$decimalSeparator$right';
    value = '$leftSymbol$value$rightSymbol';

    return value;
  }
}

class MoneyFormatter extends TextInputFormatter {
  final String decimalSeparator;
  final String thousandSeparator;
  final String leftSymbol;
  final String rightSymbol;

  MoneyFormatter({
    this.decimalSeparator = ',',
    this.thousandSeparator = '.',
    this.leftSymbol = r'R$ ',
    this.rightSymbol = '',
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String value = UtilFormatter.formatDecimal(
      decimalSeparator: decimalSeparator,
      thousandSeparator: thousandSeparator,
      leftSymbol: leftSymbol,
      rightSymbol: rightSymbol,
      value: newValue.text,
    );

    return TextEditingValue(
      text: value,
      selection:
          TextSelection(baseOffset: value.length, extentOffset: value.length),
    );
  }
}
