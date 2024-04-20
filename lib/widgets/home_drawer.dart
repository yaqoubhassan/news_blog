import 'package:flutter/material.dart';
import 'package:news_blog1/screens/bookmarked.dart';
import 'package:news_blog1/screens/create_article_screen.dart';

import '../utilities/constants.dart';
import '../screens/audio_articles.dart';
import '../screens/home.dart';
import 'drawer_menu_item.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0, bottom: 25.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40.0,
                        backgroundImage: AssetImage('assets/images/yaqoub.jpg'),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yaqoub Hassan',
                            style: kUsernameTextStyle,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'View Profile',
                            style: kLittleTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DrawerMenuItem(menuItem: 'Home', routeName: Home.id,),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Audio', routeName: AudioArticlesScreen.id,),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Create New Article', routeName:
                    CreateArticleScreen.id,),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Bookmark', routeName:
                    BookMarked.id,),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Settings'),
                    Divider(
                      thickness: 0.5,
                    ),
                    SizedBox(height: 200,),
                    DrawerMenuItem(menuItem: 'Logout', isLogout: true),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
