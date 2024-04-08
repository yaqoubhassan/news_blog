import 'package:flutter/material.dart';
import 'package:news_blog1/constants.dart';
import 'package:news_blog1/screens/login.dart';
import 'package:news_blog1/widgets/auth_suggestion.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:news_blog1/widgets/input_field.dart';
import 'package:news_blog1/widgets/phone_number_field.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final FocusNode _focusNode = FocusNode();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Create New',
                  style: kPageTitleTextStyle,
                ),
                const Text(
                  'Account',
                  style: kPageTitleTextStyle,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputField(
                  obscure: false,
                  placeholder: 'Enter Your Full Name',
                  textFieldNode: pin1FocusNode,
                  nextFieldNode: pin2FocusNode,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputField(
                  obscure: false,
                  placeholder: 'Enter Your Email Address',
                  textFieldNode: pin2FocusNode,
                  nextFieldNode: pin3FocusNode,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                PhoneNumberField(
                    fieldFocusNode:pin3FocusNode,
                    nextFieldNode: pin4FocusNode,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InputField(
                    obscure: true,
                    placeholder: 'Enter Your Password',
                    textFieldNode: pin4FocusNode),
                const SizedBox(
                  height: 30.0,
                ),
                const FormButton(buttonText: 'Create Account'),
                const SizedBox(
                  height: 20.0,
                ),
                const Center(
                    child: AuthSuggestion(
                  firstText: 'Already have an account?',
                  secondText: ' Sign In',
                  route: LoginScreen.id,
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
