import 'package:flutter/material.dart';
import 'package:news_blog1/utilities/constants.dart';


class InputField extends StatefulWidget {
  const InputField({super.key, this.placeholder, this.obscure = false, this
      .textFieldNode, this.nextFieldNode, this.maxLines = 1, this
      .textCapitalization = false, this.validator, this.controller, this
      .errorText, this.onChanged});

  final String? placeholder;
  final bool obscure;
  final FocusNode? textFieldNode;
  final FocusNode? nextFieldNode;
  final int maxLines;
  final bool textCapitalization;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? errorText;
  final Function(String)? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscured = false;

  final FocusNode _focusNode = FocusNode();

  void nextField(focusNode) {
      focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscure;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      textCapitalization: widget.textCapitalization ? TextCapitalization
          .words :
      TextCapitalization.none,
      maxLines: widget.maxLines,
      focusNode: widget.textFieldNode,
      style: const TextStyle(fontSize: 18.0),
      obscureText: _isObscured,
      decoration:  InputDecoration(
        errorText: widget.errorText,
        hintStyle: const TextStyle(color: Color(0xFFC0C0C0),),
        hintText: widget.placeholder,
        filled: true,
        fillColor: const Color(0xFFEDEBEB),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(20.0,),),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kOrangeColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0,),),
        ),
        suffixIcon: widget.obscure
            ? IconButton(
          color: kOrangeColor,
          icon: Icon(_isObscured ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
      ),
      onFieldSubmitted: (value) {
        nextField(widget.nextFieldNode);
      },
    );
  }
}
