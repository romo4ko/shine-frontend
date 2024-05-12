
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FilledTextField extends StatefulWidget {

  final String title;
  final String placeholder;
  final TextEditingController? controller;

  const FilledTextField({
    super.key,
    required this.title,
    required this.placeholder,
    this.controller
  });

  @override
  State<FilledTextField> createState() => _FilledTextFieldState();
}

class _FilledTextFieldState extends State<FilledTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter'
            ),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            labelStyle: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontFamily: 'Inter'),
            fillColor: const Color.fromRGBO(20, 20, 20, 0.8),
            filled: true,
            focusColor: Colors.white,
            labelText: widget.placeholder,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}