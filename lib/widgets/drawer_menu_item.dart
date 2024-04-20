import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../screens/login.dart';

class DrawerMenuItem extends StatefulWidget {
  const DrawerMenuItem({super.key, required this.menuItem, this.routeName,
    this.isLogout = false});

  final String menuItem;
  final String? routeName;
  final bool isLogout;

  @override
  State<DrawerMenuItem> createState() => _DrawerMenuItemState();
}

class _DrawerMenuItemState extends State<DrawerMenuItem> {
  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final baseUrl = dotenv.env['BASE_URL'];
      Uri url = Uri.parse('$baseUrl/auth/logout');
      http.Response response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Logout successful, clear token and navigate to login screen
        await prefs.remove('token');
        if (mounted) {
          Navigator.pushReplacementNamed(context, LoginScreen.id);
        }
      } else {
        // Logout failed
        print('Failed to logout: ${response.body}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: () {
          if (widget.isLogout) {
            logout();
          } else {
            Navigator.pushNamed(context, widget.routeName!);
          }
        },
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, top: 15.0, bottom: 15.0),
                child: Text(
                  widget.menuItem,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}