import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnderlineTextField extends StatefulWidget {

  final String text;
  final TextEditingController? controller;

  const UnderlineTextField({
    super.key,
    required this.text,
    this.controller
  });

  @override
  State<UnderlineTextField> createState() => _UnderlineTextFieldState();
}

class _UnderlineTextFieldState extends State<UnderlineTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
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