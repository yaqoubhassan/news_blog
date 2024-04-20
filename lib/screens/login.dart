import 'package:flutter/material.dart';
import 'package:news_blog1/screens/registration.dart';
import 'package:news_blog1/widgets/auth_suggestion.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/input_field.dart';
import 'package:news_blog1/utilities/constants.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_service.dart';
import '../utilities/validations.dart';
import '../widgets/suggestion_list.dart';
import 'forgot_password.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  bool showSuggestions = false;
  String? selectedSuggestion;
  List<String> matchingEmails = [];
  String? _errorMessage;
  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  late FocusNode pin1FocusNode;
  late FocusNode pin2FocusNode;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      setState(() {
        _isLoading = true;
      });

      AuthService.login(
        _emailController.text,
        _passwordController.text,
      ).then((success) {
        setState(() {
          _isLoading = false;
          if (success) {
            Navigator.pushNamed(context, Home.id);
          } else {
            _errorMessage = 'Invalid login credentials';
          }
        });
      });
    }
  }

  void _onSuggestionSelected(bool showSuggestions) {
    setState(() {
      this.showSuggestions = showSuggestions;
    });
  }

  Future<List<String>> fetchEmails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? emails = prefs.getStringList('emails');
    return emails ?? [];
  }

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
            child: Form(
              key: _formKey,
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kOrangeColor,
                      ),
                    )
                  : Column(
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
                        if (_errorMessage != null)
                          Text(
                            _errorMessage!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        InputField(
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              fetchEmails().then((storedEmails) {
                                List<String> matchingEmails = storedEmails
                                    .where((email) => email.startsWith(value))
                                    .toList();
                                setState(() {
                                  showSuggestions = matchingEmails.isNotEmpty;
                                  // Use matchingEmails to display suggestions
                                });
                              });
                            } else {
                              setState(() {
                                showSuggestions = false;
                              });
                            }
                          },
                          placeholder: 'Enter Email Address',
                          obscure: false,
                          nextFieldNode: pin2FocusNode,
                          controller: _emailController,
                          validator: validateEmail,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Stack(
                          children: [
                            InputField(
                              placeholder: 'Enter Password',
                              obscure: true,
                              textFieldNode: pin2FocusNode,
                              controller: _passwordController,
                              validator: validatePassword,
                            ),
                            SuggestionList(
                              matchingEmails: matchingEmails,
                              fetchEmails: fetchEmails(),
                              emailController: _emailController,
                              showSuggestions: showSuggestions,
                              onSuggestionSelected:
                                  _onSuggestionSelected, // Pass callback function
                            ),
                          ],
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
                            _submitForm();
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
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
