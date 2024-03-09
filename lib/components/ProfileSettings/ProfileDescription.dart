
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDescription extends StatefulWidget {

  const ProfileDescription({
    super.key,
  });

  @override
  State<ProfileDescription> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
              'Описание профиля',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
              'Введите описание профиля',
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