import 'package:flutter/material.dart';

import '../custom_card.dart';

class SportsTabView extends StatefulWidget {
  const SportsTabView({super.key});

  @override
  State<SportsTabView> createState() => _SportsTabViewState();
}

class _SportsTabViewState extends State<SportsTabView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Sports',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/cr7.jpg', showDivider: true,
            ),
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/ronaldo.jpg', showDivider: false,
            )
          ],
        ),
      ),
    );
  }
}
