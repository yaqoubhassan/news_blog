import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_tab_bar.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white, size: 35.0),
      backgroundColor: kOrangeColor,
      title: const Center(
        child: Text(
          'News Blog',
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0),
        ),
      ),
      bottom: const CustomTabBar(),
    );
  }
}
