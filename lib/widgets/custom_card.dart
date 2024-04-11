import 'package:flutter/material.dart';
import 'package:news_blog1/screens/audio_news_details.dart';
import 'package:news_blog1/screens/news_details.dart';

import '../constants.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.title,
      required this.content,
      required this.date,
      required this.imagePath,
      required this.showDivider,
      this.isAudioArticle = false});

  final String title;
  final String content;
  final String date;
  final String imagePath;
  final bool showDivider;
  final bool isAudioArticle;

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
            widget.isAudioArticle ? Navigator.pushNamed(context, AudioNewsDetails.id) :
            Navigator.pushNamed(context, NewsDetails.id);
          },
          child: widget.isAudioArticle
              ? Row(
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
                  ],
                )
              : Row(
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
        widget.showDivider
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Divider(
                  thickness: 0.5,
                ),
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
      ],
    );
  }
}
