import 'package:senai_mymoney_app/src/shared/helpers/date_helper.dart';

class ExpenseModel {
  late String category;
  late String description;
  late double value;
  late String registrationDate;

  ExpenseModel({
    required this.category,
    required this.description,
    required this.value,
    required this.registrationDate,
  });

  ExpenseModel.fromJson(Map<String, dynamic> json) {
    category = json["category"];
    description = json["description"];
    value = json["value"].toDouble();
    registrationDate =
        DateHelper.getFormatDMY(DateTime.parse(json["registrationDate"]));
  }
}
