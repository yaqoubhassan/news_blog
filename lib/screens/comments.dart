import 'package:flutter/material.dart';
import 'package:news_blog1/constants.dart';
import 'package:news_blog1/widgets/footer.dart';

import '../widgets/cards/custom_card.dart';



class CommentsScreen extends StatefulWidget {
  static const String id = 'comments_screen';
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kOrangeColor,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
        shadowColor: kOrangeColor,
        title: const Center(
          child: Text(
            'Comments',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20.0),
                  child: Column(
                    children: [
                      CustomCard(
                        category: 'Sports',
                        title:
                            'NHL1 roundup: Mika Zibanejad\'s record night powers Rangers',
                        date: '08 Apr 2024',
                        imagePath: 'assets/images/sports_car.jpg',
                        showDivider: false,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.45
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Divider(
                        thickness: 0.5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Yaqoub Hassan',
                                style: kUsernameTextStyle,
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                'This is very helpful. Thanks!',
                                style: TextStyle(fontSize: 18.0),
                              ),
                              SizedBox(height: 5.0,),
                              Text(
                                '08 Apr 2024 12:00',
                                style: kLittleTextStyle,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.black12,
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                   Expanded(
                    child: TextField(
                      style: const TextStyle(fontSize: 18.0),
                      decoration: const InputDecoration(
                        hintText: 'Enter your comment...',
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {

                      },
                    ),
                  ),
                  Container(
                    color: kOrangeColor,
                    child: IconButton(
                      style: ButtonStyle(
                        shadowColor:
                        MaterialStateProperty.all<Color>(kOrangeColor),
                      ),
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20.0,
                          horizontal: 20.0),
                      icon: const Icon(Icons.send),
                      onPressed: () {
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
