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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.0,),
          CustomCard(
            title: 'Science',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/science.jpg',
          ),
          CustomCard(
            title: 'Science',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/science1.jpg',
          )
        ],
      ),
    );
  }
}
