import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_blog1/screens/registration.dart';
import 'package:news_blog1/widgets/auth_suggestion.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/input_field.dart';
import 'package:news_blog1/constants.dart';
import 'package:news_blog1/widgets/form_button.dart';

import 'forgot_password.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNode = FocusNode();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 30.0, right: 30.0, top: 100.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to',
                  style: kPageTitleTextStyle,
                ),
                const Text(
                  'News Blog',
                  style: kPageTitleTextStyle,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputField(
                  placeholder: 'Enter Email Address',
                  obscure: false,
                  nextFieldNode: pin2FocusNode,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputField(
                  placeholder: 'Enter Password',
                  obscure: true,
                  textFieldNode: pin2FocusNode,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, ForgotPassword.id);
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: kOrangeColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                FormButton(
                  buttonText: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamed(context, Home.id);
                  },
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Center(
                    child: AuthSuggestion(
                  firstText: 'Don\'t have an account?',
                  secondText: ' Sign Up',
                  route: RegistrationScreen.id,
                )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
