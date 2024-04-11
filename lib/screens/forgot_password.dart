import 'package:flutter/material.dart';
import 'package:news_blog1/constants.dart';
import 'package:news_blog1/widgets/footer.dart';
import 'package:news_blog1/widgets/form_button.dart';
import 'package:news_blog1/widgets/input_field.dart';

class ForgotPassword extends StatelessWidget {
  static const String id = 'forgot_password_screen';
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kOrangeColor,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 150.0),
          child: Column(
            children: [
              InputField(
                obscure: false,
                placeholder: 'Enter Email Address',
              ),
              SizedBox(
                height: 30.0,
              ),
              FormButton(buttonText: 'Send Password'),
              SizedBox(
                height: 20.0,
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
