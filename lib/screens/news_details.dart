import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/form_button.dart';

import '../constants.dart';

bool _checked = false;

class NewsDetails extends StatefulWidget {
  static const String id = 'new_details';
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'News Details',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'News Title',
                  style: TextStyle(
                      color: kOrangeColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _checked = !_checked;
                        });
                      },
                      child: Icon(
                        _checked ? Icons.bookmark : Icons.bookmark_border,
                        size: 30.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/images/tech1.jpg'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        CircleAvatar(
                          radius: 40.0,
                          backgroundImage:
                              AssetImage('assets/images/yaqoub.jpg'),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'by Yaqoub Hassan',
                              style: kUsernameTextStyle,
                            ),
                            Text(
                              '08 Apr 2024',
                              style: kLittleTestStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          elevation: MaterialStateProperty.all<double>(4.0),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black)),
                      child: const Text(
                        'Follow',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                ),
                // const SizedBox(height: 30.0,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50.0),
                  child: FormButton(buttonText: 'Comment'),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
