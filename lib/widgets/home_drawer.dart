import 'package:flutter/material.dart';
import 'package:news_blog1/screens/bookmarked.dart';
import 'package:news_blog1/screens/create_article_screen.dart';

import '../screens/login.dart';
import '../services/auth_service.dart';
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
  void logout() {
    AuthService.logout().then((success) {
      if (success) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: const LoginScreen(),
              );
            },
          ),
        );
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Set a fixed width for the drawer
      child: Drawer(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, left: 30.0, bottom: 25.0),
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
              const Divider(thickness: 0.5),
              const DrawerMenuItem(menuItem: 'Home', routeName: Home.id),
              const Divider(thickness: 0.5),
              const DrawerMenuItem(menuItem: 'Audio', routeName: AudioArticlesScreen.id),
              const Divider(thickness: 0.5),
              const DrawerMenuItem(menuItem: 'Create New Article', routeName: CreateArticleScreen.id),
              const Divider(thickness: 0.5),
              const DrawerMenuItem(menuItem: 'Bookmark', routeName: BookMarked.id),
              const Divider(thickness: 0.5),
              const DrawerMenuItem(menuItem: 'Settings',),
              const Divider(thickness: 0.5),
              const SizedBox(height: 200),
              ListTile(
                title: const Text('Logout', style: TextStyle(fontSize: 20.0),),
                trailing: const Icon(Icons.logout),
                iconColor: kOrangeColor,
                onTap: () {
                  logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
