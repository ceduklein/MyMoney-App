import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class AppLogoTitle extends StatelessWidget {
  final String title;
  final double? titleSize;
  final double? iconSize;

  const AppLogoTitle(
      {super.key, required this.title, this.titleSize, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.currency_exchange,
          color: AppColors.logo,
          size: iconSize ?? 100,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 25),
          child: Text(title,
              style: TextStyle(
                  color: AppColors.logo,
                  fontSize: titleSize ?? 20,
                  fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
