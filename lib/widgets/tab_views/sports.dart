import 'package:flutter/material.dart';

import '../custom_card.dart';

class SportsTabView extends StatefulWidget {
  const SportsTabView({super.key, this.isAudioArticle = false});

  final bool isAudioArticle;

  @override
  State<SportsTabView> createState() => _SportsTabViewState();
}

class _SportsTabViewState extends State<SportsTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Sports',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/cr7.jpg', showDivider: true,
              isAudioArticle: widget.isAudioArticle,
            ),
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/ronaldo.jpg', showDivider: false,
              isAudioArticle: widget.isAudioArticle,
            ),
          ],
        ),
      ),
    );
  }
}
