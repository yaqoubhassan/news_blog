import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../utilities/constants.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  List<String> _suggestions = ['example1@example.com', 'example2@example'
      '.com', 'example3@example.com'];

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<String>(
      builder: (context, controller, focusNode) => TextField(
        controller: controller,
        focusNode: focusNode,
        autofocus: true,
        style: DefaultTextStyle.of(context)
            .style
            .copyWith(fontSize: 18.0),
        decoration: const InputDecoration(
          // errorText: _suggestions.isEmpty && _controller.text.isNotEmpty ? 'No suggestions found' : null,
          // errorText: widget.errorText,
          hintStyle: TextStyle(
            color: Color(0xFFC0C0C0),
            fontSize: 18.0,
            fontStyle: FontStyle.normal
          ),
          hintText: 'Enter Email',
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
            borderSide: BorderSide(
              color: kOrangeColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
        ),
      ),
      decorationBuilder: (context, child) {
        return const InputDecorator(
          decoration: InputDecoration(
            // errorText: _suggestions.isEmpty && _controller.text.isNotEmpty ? 'No suggestions found' : null,
            // errorText: widget.errorText,
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
              borderSide: BorderSide(
                color: kOrangeColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
          ),
        );
      },
        suggestionsCallback: (pattern) {
          setState(() {
            _suggestions = ['example1@example.com', 'example2@example.com', 'example3@example.com']
                .where((email) => email.startsWith(pattern))
                .toList();
            // _showError = _suggestions.isEmpty && _controller.text.isNotEmpty;
          });
          return _suggestions;
        },
      itemBuilder: (context, suggestion) {
        return ListTile(
          title: Text(suggestion),
        );
      },
      // onSuggestionSelected: (suggestion) {
      //   // Do something when a suggestion is selected
      // },
      // validator: (value) {
      //   if (value == null || !value.contains('@')) {
      //     return 'Please enter a valid email address';
      //   }
      //   return null;
      // },
      onSelected: (String value) {},
    );
  }
}
