
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:masked_text/masked_text.dart';

class UnderlineBirthdateField extends StatelessWidget {

  final String text;

  const UnderlineBirthdateField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaskedTextField(
      mask: "##.##.####",
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
        labelText: text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}