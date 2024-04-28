import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utilities/constants.dart';
import '../cards/custom_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TabViewChild extends StatefulWidget {
  const TabViewChild({super.key, this.isAudioArticle = false, this.category});

  final bool isAudioArticle;
  final String? category;

  @override
  State<TabViewChild> createState() => _TabViewChildState();
}

class _TabViewChildState extends State<TabViewChild> {
  bool _isLoadingArticles = false;

  List<dynamic> articles = [];

  void getAllArticles() async {
    setState(() {
      _isLoadingArticles = true;
    });
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      var url = Uri.parse("$baseUrl/articles?category=${widget.category}");
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
      } else {}
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
        child: _isLoadingArticles
            ? const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                  child: CircularProgressIndicator(
                    color: kOrangeColor,
                  ),
                ),
              )
            : articles.isEmpty
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No records found!',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: articles.map((article) {
                      String createdAt = article['created_at'];
                      DateTime dateTime = DateTime.parse(createdAt);
                      String formattedDate =
                          DateFormat('dd MMM yyyy').format(dateTime);
                      return CustomCard(
                        category: article['category'],
                        title: article['title'],
                        date: formattedDate,
                        imagePath: article['cover_image'],
                        showDivider:
                            true, // You can adjust this based on your needs
                        isAudioArticle: widget.isAudioArticle,
                      );
                    }).toList(),
                  ),
      ),
    );
  }
}
