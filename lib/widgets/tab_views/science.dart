import 'package:flutter/material.dart';

import '../cards/custom_card.dart';

class ScienceTabView extends StatefulWidget {
  const ScienceTabView({super.key, this.isAudioArticle = false});

  final bool isAudioArticle;

  @override
  State<ScienceTabView> createState() => _ScienceTabViewState();
}

class _ScienceTabViewState extends State<ScienceTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              category: 'Science',
              title:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/science.jpg', showDivider: true,
              isAudioArticle: widget.isAudioArticle,
            ),
            CustomCard(
              category: 'Science',
              title:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/science1.jpg', showDivider: false,
              isAudioArticle: widget.isAudioArticle,
            )
          ],
        ),
      ),
    );
  }
}
