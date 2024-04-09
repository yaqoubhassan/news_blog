import 'package:flutter/material.dart';

import '../constants.dart';
import 'drawer_menu_item.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

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
                    DrawerMenuItem(menuItem: 'Home'),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Audio'),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Create New Article'),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Bookmark'),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Membership'),
                    Divider(
                      thickness: 0.5,
                    ),
                    DrawerMenuItem(menuItem: 'Settings'),
                    Divider(
                      thickness: 0.5,
                    ),
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
