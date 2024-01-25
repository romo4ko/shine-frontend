
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextArea extends StatefulWidget {

  final String title;
  final String placeholder;

  const TextArea({
    super.key,
    required this.title,
    required this.placeholder,
  });

  @override
  State<TextArea> createState() => _TextAreaState();
}

class _TextAreaState extends State<TextArea> {
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
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 5,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              height: 1.5
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            label: Text(
                widget.placeholder,
                textAlign: TextAlign.start,
                style: const TextStyle(height: 1.5),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignLabelWithHint: true,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter',
                height: 1.5
            ),
            fillColor: const Color.fromRGBO(20, 20, 20, 0.8),
            filled: true,
            focusColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}