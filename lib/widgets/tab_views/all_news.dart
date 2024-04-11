import 'package:flutter/material.dart';
import 'package:news_blog1/screens/latest_news.dart';
import 'package:news_blog1/widgets/custom_carousel.dart';

import '../../constants.dart';
import '../custom_card.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key, this.showCarousel = true, this.isAudioArticle =
      false});

  final bool showCarousel;
  final bool isAudioArticle;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  final List<String> images = [
    'assets/images/newspaper.jpg',
    'assets/images/cr7.jpg',
    'assets/images/tech.jpg',
    'assets/images/fashion.jpg',
    'assets/images/tech1.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            widget.showCarousel ? CustomCarousel(
              images: images,
              activeIndicatorBeginColor: kOrangeColor,
              activeIndicatorEndColor: Colors.purple,
            ) : const SizedBox(),
            // const SizedBox(
            //     height: 20), // Space between indicator and other widgets
            widget.isAudioArticle ? const SizedBox() : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LatestNews.id);
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                children: [
                  CustomCard(
                    title: 'Sports',
                    content:
                        'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
                    date: '08 Apr 2024',
                    imagePath: 'assets/images/sports_car.jpg',
                    showDivider: true,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                  CustomCard(
                    title: 'Technology',
                    content:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '07 Apr 2024',
                    imagePath: 'assets/images/tech1.jpg',
                    showDivider: true,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                  CustomCard(
                    title: 'Fashion',
                    content:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '22 Jun 2023',
                    imagePath: 'assets/images/fashion.jpg',
                    showDivider: true,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                  CustomCard(
                    title: 'Science',
                    content:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '12 Aug 2017',
                    imagePath: 'assets/images/science.jpg',
                    showDivider: true,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                  CustomCard(
                    title: 'Technology',
                    content:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '01 Apr 2012',
                    imagePath: 'assets/images/tech.jpg',
                    showDivider: true,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                  CustomCard(
                    title: 'Sports',
                    content:
                        'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '08 Apr 2024',
                    imagePath: 'assets/images/ronaldo.jpg',
                    showDivider: false,
                    isAudioArticle: widget.isAudioArticle,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
