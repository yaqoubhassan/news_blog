import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/custom_tab_bar.dart';
import 'package:news_blog1/widgets/tab_views/custom_tab_view.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/home_drawer.dart';

import '../constants.dart';

class Home extends StatefulWidget {
  static const String id = 'home_screen';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 35.0),
          backgroundColor: kOrangeColor,
          title: const Text(
            'News Blog',
            style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          bottom: const CustomTabBar(color: kOrangeColor,),
        ),
        drawer: const HomeDrawer(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: CustomTabView(showCarousel: true,),
          ),
        ),
        bottomNavigationBar: const Footer(),

      ),
    );
  }
}
