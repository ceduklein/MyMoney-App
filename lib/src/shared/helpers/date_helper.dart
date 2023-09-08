import 'package:intl/intl.dart';

class DateHelper {
  static String getFormatDMY(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String getDayOfMonth() {
    final DateFormat formatter = DateFormat('dd');
    return formatter.format(DateTime.now());
  }
}
