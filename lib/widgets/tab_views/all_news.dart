import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:news_blog1/screens/latest_news.dart';
import 'package:news_blog1/widgets/custom_carousel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/constants.dart';
import '../cards/custom_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllNews extends StatefulWidget {
  const AllNews({super.key, this.showCarousel = true, this.isAudioArticle =
      false});

  final bool showCarousel;
  final bool isAudioArticle;

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  final List<String> images = [
    'assets/images/newspaper.jpg',
    'assets/images/cr7.jpg',
    'assets/images/tech.jpg',
    'assets/images/fashion.jpg',
    'assets/images/tech1.jpg'
  ];
  bool _isLoadingArticles = false;

  List<dynamic> articles = [];

  void getAllArticles() async {
    setState(() {
      _isLoadingArticles = true;
    });
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      var url = Uri.parse("$baseUrl/articles");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');


      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );


      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        setState(() {
          _isLoadingArticles = false;
          articles = jsonResponse['data'];
        });

        print("my data $articles");
      } else {
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching articles: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllArticles();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            widget.showCarousel ? CustomCarousel(
              images: images,
              activeIndicatorBeginColor: kOrangeColor,
              activeIndicatorEndColor: Colors.purple,
            ) : const SizedBox(),
            // const SizedBox(
            //     height: 20), // Space between indicator and other widgets
            widget.isAudioArticle ? const SizedBox() : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, LatestNews.id);
                    },
                    child: const Text(
                      'Show More',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kOrangeColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isLoadingArticles ? const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: CircularProgressIndicator(
                color: kOrangeColor,
              ),
            ) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Column(
                children: articles.map((article) {
                  String createdAt = article['created_at'];
                  DateTime dateTime = DateTime.parse(createdAt);
                  String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
                  return CustomCard(
                    category: article['category'],
                    title: article['title'],
                    date: formattedDate,
                    imagePath: article['cover_image'],
                    showDivider: true, // You can adjust this based on your needs
                    isAudioArticle: widget.isAudioArticle,
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
