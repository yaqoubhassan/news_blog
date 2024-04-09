import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_blog1/screens/latest_news.dart';

import '../../constants.dart';
import '../custom_card.dart';
import '../custom_indicator.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

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

  final PageController _controller = PageController(viewportFraction: 0.9);

  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});

    _timer = Timer.periodic(const Duration(seconds: 7), (timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            SizedBox(
              height: 180, // Height of the carousel
              // width: MediaQuery.of(context).size.width * 0.8,
              child: PageView.builder(
                controller: _controller,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 30.0),
                    // color: Colors.red,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        images[index],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  );
                },
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 10), // Space between carousel and indicator
            CustomIndicator(
              imagesLength: images.length,
              controller: _controller,
            ),
            const SizedBox(
                height: 20), // Space between indicator and other widgets
            Padding(
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                children: [
                  CustomCard(
                    title: 'Sports',
                    content:
                    'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
                    date: '08 Apr 2024',
                    imagePath: 'assets/images/sports_car.jpg', showDivider: true,
                  ),
                  CustomCard(
                    title: 'Technology',
                    content:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '07 Apr 2024',
                    imagePath: 'assets/images/tech1.jpg', showDivider: true,
                  ),
                  CustomCard(
                    title: 'Fashion',
                    content:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '22 Jun 2023',
                    imagePath: 'assets/images/fashion.jpg', showDivider: true,
                  ),
                  CustomCard(
                    title: 'Science',
                    content:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '12 Aug 2017',
                    imagePath: 'assets/images/science.jpg', showDivider: true,
                  ),
                  CustomCard(
                    title: 'Technology',
                    content:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '01 Apr 2012',
                    imagePath: 'assets/images/tech.jpg', showDivider: true,
                  ),
                  CustomCard(
                    title: 'Sports',
                    content:
                    'Lorem ipsum dolor sit amet consectetur adipisicing elit. Excepturi, nesciunt!',
                    date: '08 Apr 2024',
                    imagePath: 'assets/images/ronaldo.jpg', showDivider: false,
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
