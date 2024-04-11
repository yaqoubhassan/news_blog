import 'package:flutter/material.dart';
import 'package:news_blog1/widgets/tab_views/all_news.dart';
import 'package:news_blog1/widgets/tab_views/fashion.dart';
import 'package:news_blog1/widgets/tab_views/science.dart';
import 'package:news_blog1/widgets/tab_views/sports.dart';
import 'package:news_blog1/widgets/tab_views/technology.dart';


class CustomTabView extends StatefulWidget {
  const CustomTabView({super.key, this.showCarousel = true, this
      .isAudioArticle = false});

  final bool showCarousel;
  final bool isAudioArticle;

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: TabBarView(
        children: <Widget>[
          AllNews(showCarousel: widget.showCarousel, isAudioArticle: widget.isAudioArticle,),
          TechnologyTabView(isAudioArticle: widget.isAudioArticle),
          FashionTabView(isAudioArticle: widget.isAudioArticle),
          SportsTabView(isAudioArticle: widget.isAudioArticle),
          ScienceTabView(isAudioArticle: widget.isAudioArticle)
        ],
      ),
    );
  }
}
