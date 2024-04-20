import 'package:flutter/material.dart';
import 'package:news_blog1/utilities/constants.dart';
import 'package:news_blog1/widgets/custom_app_bar.dart';
import 'package:news_blog1/widgets/custom_carousel.dart';
import 'package:news_blog1/widgets/tab_views/custom_tab_view.dart';

import '../widgets/custom_tab_bar.dart';
import '../widgets/footer.dart';

class AudioArticlesScreen extends StatefulWidget {
  static const String id = 'audio_articles_screen';
  const AudioArticlesScreen({super.key});

  @override
  State<AudioArticlesScreen> createState() => _AudioArticlesScreenState();
}

class _AudioArticlesScreenState extends State<AudioArticlesScreen>
    with SingleTickerProviderStateMixin {
  List<String> images = [
    'assets/images/newspaper.jpg',
    'assets/images/cr7.jpg',
    'assets/images/tech.jpg',
    'assets/images/fashion.jpg',
    'assets/images/tech1.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: const CustomAppBar(
          titleText: 'Audio Articles',
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              surfaceTintColor: kOrangeColor,
              automaticallyImplyLeading: false,
              backgroundColor: kOrangeColor,
              pinned: true,
              floating: true,
              snap: false,
              expandedHeight: 280.0,
              flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CustomCarousel(
                      images: images,
                      activeIndicatorBeginColor: Colors.white,
                      activeIndicatorEndColor: Colors.purple,
                      isAudioArticle: true,
                    ),
                  )),
              bottom: const CustomTabBar(
                color: kOrangeColor,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                  SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight
                      - kBottomNavigationBarHeight + 300, // Adjust the height
                    // based on your layout
                  child: const CustomTabView(showCarousel: false,
                    isAudioArticle: true,),
                ),
              ]),
            ),
          ],
        ),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}
