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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.0,),
          CustomCard(
            title: 'Sports',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/cr7.jpg',
          ),
          CustomCard(
            title: 'Fashion',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/ronaldo.jpg',
          )
        ],
      ),
    );
  }
}
