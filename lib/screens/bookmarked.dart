import 'package:flutter/material.dart';

import '../constants.dart';

class BookMarked extends StatelessWidget {
  static const String id = 'bookmarked';
  const BookMarked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Bookmarked',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
        elevation: 4,
        shadowColor: kOrangeColor,
      ),
    );
  }
}
