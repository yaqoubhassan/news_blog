
import 'package:flutter/material.dart';
import 'package:news_blog1/screens/comments.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/form_button.dart';

import '../utilities/constants.dart';

bool _checked = false;

class NewsDetails extends StatefulWidget {
  static const String id = 'news_details';
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  bool _following = false;

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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            showCloseIcon: true,
                            closeIconColor: Colors.black,
                            width: 300.0,
                            // margin: const EdgeInsets.symmetric(horizontal: 30.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            elevation: 20.0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: const Color(0xFFE1E1E0),
                            content:  Center(
                              child: Text( _checked ?
                                'Added to Bookmark' : 'Removed from Bookmark',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
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
                    const Expanded(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            backgroundImage:
                                AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'by Yaqoub Hassan',
                                    style: kUsernameTextStyle,
                                    softWrap: true,
                                  ),
                                  Text(
                                    '08 Apr 2024',
                                    style: kLittleTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _following = !_following;
                        });
                      },
                      style: ButtonStyle(
                          shadowColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          elevation: MaterialStateProperty.all<double>(4.0),
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                                  _following ?
                                  const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10) : const
                                  EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10)),
                          backgroundColor: _following ?
                              MaterialStateProperty.all<Color>(const Color(0xFFE1E1E0))
                              : MaterialStateProperty.all<Color>(Colors.black) ),
                      child: _following ? const Text(
                        'Following',
                        style: TextStyle(color: Colors.black54),
                      ) : const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Follow',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
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
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(fontSize: 16.0),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  textAlign: TextAlign.justify,
                  kNewsDetailsText,
                  style: TextStyle(fontSize: 16.0),
                ),
                // const SizedBox(height: 30.0,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: FormButton(
                    buttonText: 'Comment',
                    onPressed: () {
                      Navigator.pushNamed(context, CommentsScreen.id);
                    },
                  ),
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
