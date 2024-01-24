
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnderlineTextField extends StatefulWidget {

  final String text;

  const UnderlineTextField({super.key, required this.text});

  @override
  State<UnderlineTextField> createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validateEmail,
      style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 10.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.6), width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(1), width: 1.0),
        ),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
        fillColor: Colors.white,
        focusColor: Colors.white,
        labelText: widget.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}