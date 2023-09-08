import 'package:flutter/material.dart';

class BarModal extends StatelessWidget {
  const BarModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              width: 45,
              height: 4,
              decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(4)),
            ),
          ),
        ),
      ],
    );
  }
}
