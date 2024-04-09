import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_card.dart';
import '../widgets/footer.dart';

class LatestNews extends StatefulWidget {
  static const String id = 'latest_news';
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _LatestNewsState();
}

class _LatestNewsState extends State<LatestNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Latest News', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.0),
          child: SingleChildScrollView(
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
                  imagePath: 'assets/images/ronaldo.jpg', showDivider: true,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
