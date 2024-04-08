import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  const DrawerMenuItem({super.key, required this.menuItem});

  final String menuItem;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15.0, bottom: 15.0),
      child: Text(
        menuItem,
        style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}