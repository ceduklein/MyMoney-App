import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:senai_mymoney_app/src/shared/colors/app_colors.dart';
import 'package:senai_mymoney_app/src/shared/components/app_button.dart';
import 'package:senai_mymoney_app/src/shared/components/app_title.dart';
import 'package:senai_mymoney_app/src/shared/components/bar_modal.dart';
import 'package:senai_mymoney_app/src/shared/helpers/input_mask.dart';
import 'package:senai_mymoney_app/src/shared/helpers/text._input_formatter.dart';

class ExpenseRegisterModal extends StatefulWidget {
  const ExpenseRegisterModal({super.key});

  @override
  State<ExpenseRegisterModal> createState() => _ExpenseRegisterModalState();
}

class _ExpenseRegisterModalState extends State<ExpenseRegisterModal> {
  final TextInputFormatter moneyFormatter = InputMask.moneyFormatter;
  late final TextEditingController? moneyTextEditingController =
      TextEditingController(text: moneyFormatter.formatText("0,00"));

  @override
  Widget build(BuildContext context) {
    final List<String> categories = <String>[
      'Alimentação',
      'Casa',
      'Dívidas',
      'Educaçao',
      'Lazer',
      'Pessoal',
      'Saúde',
      'Serviço',
      'Transporte'
    ];

    String dropdownValue = categories.first;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Scaffold(
        backgroundColor: AppColors.appPageBackground,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BarModal(),
              const AppTitle(title: 'Nova despesa'),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        inputFormatters: [moneyFormatter],
                        controller: moneyTextEditingController,
                        enabled: true,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: TextFormField(
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          enabled: true,
                          textAlign: TextAlign.start,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              label: Text(
                                'Descrição',
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.green)),
                              prefixIcon: Icon(
                                Icons.description_outlined,
                                color: Colors.green,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 10),
                        child: DropdownButton<String>(
                          icon: const Icon(Icons.category_outlined,
                              color: Colors.green),
                          enableFeedback: true,
                          isExpanded: true,
                          value: dropdownValue,
                          style: const TextStyle(
                            color: Colors.green,
                          ),
                          underline: Container(
                            height: 1,
                            color: Colors.green,
                          ),
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              dropdownValue = value!;
                            });
                          },
                          items: categories
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      TextFormField(
                        enabled: true,
                        textAlign: TextAlign.start,
                        autofocus: false,
                        keyboardType: TextInputType.datetime,
                        cursorColor: Colors.green,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.green,
                            ),
                            label: Text(
                              'Data',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green),
                            ),
                            focusColor: Colors.white,
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: AppButton(
                            action: () {
                              Navigator.pop(context);
                            },
                            label: 'Despesa'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
