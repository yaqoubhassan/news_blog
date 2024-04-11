import 'package:flutter/material.dart';

import '../custom_card.dart';

class FashionTabView extends StatefulWidget {
  const FashionTabView({super.key, this.isAudioArticle = false});


  final bool isAudioArticle;

  @override
  State<FashionTabView> createState() => _FashionTabViewState();
}

class _FashionTabViewState extends State<FashionTabView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/fashion.jpg', showDivider: true,
              isAudioArticle: widget.isAudioArticle,
            ),
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/fashion1.jpg', showDivider: false,
              isAudioArticle: widget.isAudioArticle,
            )
          ],
        ),
      ),
    );
  }
}
