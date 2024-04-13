import 'package:flutter/material.dart';
import 'package:news_blog1/screens/audio_news_details.dart';
import 'package:news_blog1/screens/news_details.dart';
import 'package:news_blog1/widgets/cards/audio_article_card.dart';
import 'package:news_blog1/widgets/cards/bookmarked_card.dart';
import 'package:news_blog1/widgets/cards/default_news_card.dart';

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.category,
      required this.title,
      required this.date,
      required this.imagePath,
      required this.showDivider,
      this.isAudioArticle = false,
      this.isBookmarked = false});

  final String category;
  final String title;
  final String date;
  final String imagePath;
  final bool showDivider;
  final bool isAudioArticle;
  final bool isBookmarked;

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
            widget.isAudioArticle
                ? Navigator.pushNamed(context, AudioNewsDetails.id)
                : Navigator.pushNamed(context, NewsDetails.id);
          },
          child: widget.isBookmarked ? BookmarkedCard(imagePath: widget
              .imagePath, category: widget.category, title: widget.title, date:
          widget.date) : (widget.isAudioArticle ? AudioArticleCard(imagePath:
          widget.imagePath, category: widget.category, title: widget.title,
              date: widget.date) : DefaultNewsCard(imagePath: widget.imagePath, category: widget.category, title: widget.title, date: widget.date)),
        ),
        widget.showDivider
            ? const Divider(
                thickness: 0.5,
              )
            : const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
              ),
      ],
    );
  }
}
