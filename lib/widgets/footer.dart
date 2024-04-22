import 'package:flutter/material.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;

    return Container(
      color: const Color(0xFFEEEDED),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© $currentYear News Blog. Made by Yaqoub.',
            style: const TextStyle(color: Color(0xFF565555)),
          ),
        ],
      ),
    );
  }
}
