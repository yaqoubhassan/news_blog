import 'package:flutter/material.dart';

import '../custom_card.dart';

class TechnologyTabView extends StatefulWidget {
  const TechnologyTabView({super.key, this.isAudioArticle =
  false});


  final bool isAudioArticle;

  @override
  State<TechnologyTabView> createState() => _TechnologyTabViewState();
}

class _TechnologyTabViewState extends State<TechnologyTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Technology',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/tech1.jpg', showDivider: true,
              isAudioArticle: widget.isAudioArticle,
            ),
            CustomCard(
              title: 'Technology',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/tech.jpg', showDivider: false,
              isAudioArticle: widget.isAudioArticle,
            ),

          ],
        ),
      ),
    );
  }
}
