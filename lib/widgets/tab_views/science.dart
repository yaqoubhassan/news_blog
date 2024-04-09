import 'package:flutter/material.dart';

import '../custom_card.dart';

class ScienceTabView extends StatefulWidget {
  const ScienceTabView({super.key});

  @override
  State<ScienceTabView> createState() => _ScienceTabViewState();
}

class _ScienceTabViewState extends State<ScienceTabView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Science',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/science.jpg', showDivider: true,
            ),
            CustomCard(
              title: 'Science',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/science1.jpg', showDivider: false,
            )
          ],
        ),
      ),
    );
  }
}
