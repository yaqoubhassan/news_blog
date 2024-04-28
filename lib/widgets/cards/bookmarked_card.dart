import 'package:flutter/material.dart';

import '../../utilities/constants.dart';

class BookmarkedCard extends StatefulWidget {
  const BookmarkedCard({super.key, required this.imagePath, required this
      .category, required this.title, required this.date});

  final String imagePath;
  final String category;
  final String title;
  final String date;

  @override
  State<BookmarkedCard> createState() => _BookmarkedCardState();
}

class _BookmarkedCardState extends State<BookmarkedCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
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
                    fontSize: 14.0, fontWeight: FontWeight.w600),
                softWrap: true,
              ),
              Text(
                widget.date,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'remove',
                child: Text('Remove'),
              )
            ];
          },
          onSelected: (value) {},
        )
      ],
    );
  }
}
