import 'package:flutter/material.dart';

import '../custom_card.dart';

class TechnologyTabView extends StatefulWidget {
  const TechnologyTabView({super.key});

  @override
  State<TechnologyTabView> createState() => _TechnologyTabViewState();
}

class _TechnologyTabViewState extends State<TechnologyTabView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Technology',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/tech1.jpg', showDivider: true,
            ),
            CustomCard(
              title: 'Technology',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/tech.jpg', showDivider: false,
            ),

          ],
        ),
      ),
    );
  }
}
