import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_blog1/screens/news_details.dart';

import '../constants.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.title, required this.content, required this.date, required this.imagePath});


  final String title;
  final String content;
  final String date;
  final String imagePath;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, NewsDetails.id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            color: kOrangeColor,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.content,
                        style: const TextStyle(
                          fontSize: 18.0,
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
                    child: Image.asset(
                      widget.imagePath,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Divider(
            thickness: 0.5,
          ),
        )
      ],
    );
  }
}
