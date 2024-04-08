import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/tab_views/all_news.dart';
import 'package:news_blog1/widgets/tab_views/fashion.dart';
import 'package:news_blog1/widgets/tab_views/science.dart';
import 'package:news_blog1/widgets/tab_views/sports.dart';
import 'package:news_blog1/widgets/tab_views/technology.dart';

import '../custom_indicator.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {

  @override
  Widget build(BuildContext context) {
    return const TabBarView(
      children: <Widget>[
        AllNews(),
        TechnologyTabView(),
        FashionTabView(),
        SportsTabView(),
        ScienceTabView()
      ],
    );
  }
}
