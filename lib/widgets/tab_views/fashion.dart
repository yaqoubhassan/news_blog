import 'package:flutter/material.dart';

import '../custom_card.dart';

class FashionTabView extends StatefulWidget {
  const FashionTabView({super.key});

  @override
  State<FashionTabView> createState() => _FashionTabViewState();
}

class _FashionTabViewState extends State<FashionTabView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/fashion.jpg', showDivider: true,
            ),
            CustomCard(
              title: 'Fashion',
              content:
              'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
              date: '08 Apr 2024',
              imagePath: 'assets/images/fashion1.jpg', showDivider: false,
            )
          ],
        ),
      ),
    );
  }
}
