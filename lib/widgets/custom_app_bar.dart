import 'package:flutter/material.dart';

import '../constants.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.titleText});

  final String titleText;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: kOrangeColor,
      title: Center(
          child: Text(
            widget.titleText,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          )),
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: kOrangeColor,
      shape: const BeveledRectangleBorder(
        side: BorderSide(
          width: 0.0,
          color: kOrangeColor
        )
      ),
      // elevation: 0,
      // shadowColor: kOrangeColor,
    );
  }
}
