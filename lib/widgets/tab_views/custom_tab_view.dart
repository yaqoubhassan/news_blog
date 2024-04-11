import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/tab_views/all_news.dart';
import 'package:news_blog1/widgets/tab_views/fashion.dart';
import 'package:news_blog1/widgets/tab_views/science.dart';
import 'package:news_blog1/widgets/tab_views/sports.dart';
import 'package:news_blog1/widgets/tab_views/technology.dart';


class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key, this.showCarousel = true});

  final bool showCarousel;

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: <Widget>[
        AllNews(showCarousel: widget.showCarousel,),
        const TechnologyTabView(),
        const FashionTabView(),
        const SportsTabView(),
        const ScienceTabView()
      ],
    );
  }
}
