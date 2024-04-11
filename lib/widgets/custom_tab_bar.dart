import 'package:flutter/material.dart';
import 'package:news_blog1/constants.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget{
  const CustomTabBar({super.key, required this.color});

  final Color? color;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  final List<String> tabs = [
    'All News',
    'Technology',
    'Fashion',
    'Sports',
    'Science'
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: kOrangeColor,
      elevation: 4,
      // borderOnForeground: false,
      color: widget.color,
      child: TabBar(
        padding: const EdgeInsets.only(right: 10.0),
        isScrollable: true,
        labelStyle: const TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w600),
        tabAlignment: TabAlignment.center,
        indicatorWeight: 4.0,
        indicatorColor: Colors.black54,
        indicatorSize: TabBarIndicatorSize.label,
        unselectedLabelStyle:
        const TextStyle(fontSize: 20.0, color: Colors.black54, fontWeight: FontWeight.w600),
        tabs: tabs.map((tab) => Tab(text: tab)).toList(),
      ),
    );
  }
}
