import 'package:flutter/material.dart';
import 'package:news_blog1/utilities/constants.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.buttonText, this.onPressed});

  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        backgroundColor: kOrangeColor,
        minimumSize: const Size(double.infinity, 50.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
      child:  Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
