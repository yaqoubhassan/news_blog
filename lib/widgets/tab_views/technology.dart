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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 15.0,),
          CustomCard(
            title: 'Technology',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/tech1.jpg',
          ),
          CustomCard(
            title: 'Technology',
            content:
            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
            date: '08 Apr 2024',
            imagePath: 'assets/images/tech.jpg',
          ),

        ],
      ),
    );
  }
}
