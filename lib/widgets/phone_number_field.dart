import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants.dart';

class PhoneNumberField extends StatefulWidget {
  const PhoneNumberField({super.key, this.fieldFocusNode, this.nextFieldNode});

  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldNode;

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {

  void nextField(focusNode) {
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      dropdownTextStyle: const TextStyle(fontSize: 18.0),
      style: const TextStyle(fontSize: 18.0,),
      initialCountryCode: 'US',
      onCountryChanged: (country) {
        // print('Country changed to: ${country.name}');
      },
      focusNode: widget.fieldFocusNode,
      disableLengthCheck: true,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Color(0xFFEDEBEB),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kOrangeColor, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(
              20.0,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusColor: kOrangeColor,
        hintText: 'Enter Phone Number',
        hintStyle: TextStyle(
            color: Color(0xFFC0C0C0),
            fontSize: 18.0,
            fontFamily: 'Roboto'),
      ),
      onSubmitted: (value) {
        nextField(widget.nextFieldNode);
      },
    );
  }
}
