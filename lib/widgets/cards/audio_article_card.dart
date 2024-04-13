import 'package:flutter/material.dart';

import '../../constants.dart';

class AudioArticleCard extends StatefulWidget {
  const AudioArticleCard({super.key, required this.imagePath, required this
      .category, required this.title, required this.date});

  final String imagePath;
  final String category;
  final String title;
  final String date;

  @override
  State<AudioArticleCard> createState() => _AudioArticleCardState();
}

class _AudioArticleCardState extends State<AudioArticleCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 150.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.imagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.5,
                    colors: <Color>[
                      Colors.black.withAlpha(0),
                      Colors.black12,
                      Colors.black45
                    ],
                  ),
                ),
                child: const Text(
                  '40:20',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.category,
                style: const TextStyle(
                    color: kOrangeColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
                softWrap: true,
              ),
              Text(
                widget.date,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
