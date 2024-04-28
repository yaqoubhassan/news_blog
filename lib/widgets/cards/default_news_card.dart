import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class DefaultNewsCard extends StatefulWidget {
  const DefaultNewsCard({super.key, required this.imagePath, required this
      .category, required this.title, required this.date});

  final String imagePath;
  final String category;
  final String title;
  final String date;

  @override
  State<DefaultNewsCard> createState() => _DefaultNewsCardState();
}

class _DefaultNewsCardState extends State<DefaultNewsCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Container(
          width: 150.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}
