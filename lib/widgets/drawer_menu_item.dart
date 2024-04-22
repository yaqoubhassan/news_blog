import 'package:flutter/material.dart';
import 'package:news_blog1/utilities/constants.dart';

class DrawerMenuItem extends StatefulWidget {
  const DrawerMenuItem({super.key, required this.menuItem, this.routeName});

  final String menuItem;
  final String? routeName;

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, widget.routeName!);
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                // color: kOrangeColor.withOpacity(0.7),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, top: 15.0, bottom: 15.0),
                  child: Text(
                    widget.menuItem,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      // color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
