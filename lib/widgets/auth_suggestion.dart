import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AuthSuggestion extends StatelessWidget {
  const AuthSuggestion({super.key, required this.firstText, this.secondText, this.route});

  final String firstText;
  final String? secondText;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
          text: firstText,
          style: kAuthTextStyle.copyWith(color: Colors.grey),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, route!);
                },
              text: secondText,
              style: kAuthTextStyle.copyWith(color: kOrangeColor),
            ),
          ]),
    );
  }
}
