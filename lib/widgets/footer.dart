import 'package:flutter/material.dart';


class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '© 2024 News Blog. Made by Yaqoub.',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
