import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:news_blog1/utilities/constants.dart';
import 'package:news_blog1/screens/login.dart';
import 'package:news_blog1/widgets/auth_suggestion.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:news_blog1/widgets/input_field.dart';
import 'package:news_blog1/widgets/phone_number_field.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/footer.dart';
import 'home.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  String emailError = '';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? validateEmail(String? value, {String? customErrorMessage}) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!EmailValidator.validate(value)) {
      return 'Please enter a valid email address';
    }

    if (customErrorMessage != null) {
      return customErrorMessage;
    }

    return null;
  }

  String phoneNumber = '';

  String? validatePhoneNumber(PhoneNumber? number) {
    if (number!.number.isEmpty) {
      return 'Please enter your phone number';
    }
    if (!number.isValidNumber()) {
      return 'Please enter a valid phone number';
    }
    phoneNumber = number.completeNumber;
    return null;
  }

  void registerUser(String name, String email, String phoneNumber, String password) async {
    try {
      final baseUrl = dotenv.env['BASE_URL'];
      var url = Uri.parse("$baseUrl/auth/register-user");
      var response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'phone_number': phoneNumber,
          'password': password,
          'password_confirmation': password
        },
      );

      if (response.statusCode == 200) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }

        var jsonResponse = json.decode(response.body);
        var token = jsonResponse['token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        if (mounted) {
          Navigator.pushNamed(context, Home.id);
        }
      } else {
        // Registration failed
        Map<String, dynamic> responseBody = json.decode(response.body);
        if (responseBody.containsKey('message')) {
          String errorMessage = responseBody['message'];
          if (errorMessage.contains('The email has already been taken')) {
            setState(() {
              // Set custom error message for email field
              emailError = 'Email is already taken';
            });
          }
        }
        if (kDebugMode) {
          print('Registration failed: ${response.body}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error registering user: $e');
      }
    }
  }


  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      registerUser(
        nameController.text,
        emailController.text,
        phoneNumber,
        passwordController.text,
      );
    }
  }

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 100.0, bottom: 30.0),
              child: Form(
                key: _formKey,
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
                      height: 20.0,
                    ),
                    InputField(
                      controller: nameController,
                      textCapitalization: true,
                      obscure: false,
                      placeholder: 'Enter Your Full Name',
                      textFieldNode: pin1FocusNode,
                      nextFieldNode: pin2FocusNode,
                      validator: validateFullName,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      controller: emailController,
                      obscure: false,
                      placeholder: 'Enter Your Email Address',
                      textFieldNode: pin2FocusNode,
                      nextFieldNode: pin3FocusNode,
                      validator: validateEmail,
                      errorText: emailError,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Stack(
                      children: [
                        PhoneNumberField(
                          validator: validatePhoneNumber,
                          fieldFocusNode: pin3FocusNode,
                          nextFieldNode: pin4FocusNode,
                        ),
                        Positioned(
                          // top: 0,
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 20.0,
                            width: 50.0,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    InputField(
                        controller: passwordController,
                        obscure: true,
                        placeholder: 'Enter Your Password',
                        textFieldNode: pin4FocusNode),
                    const SizedBox(
                      height: 30.0,
                    ),
                    FormButton(
                      buttonText: 'Create Account',
                      onPressed: _submitForm,
                    ),
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
        ),
        bottomNavigationBar: const Footer(),
      ),
    );
  }
}
