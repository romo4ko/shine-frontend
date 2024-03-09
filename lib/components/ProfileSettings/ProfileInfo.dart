
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:shine/components/ProfileSettings/ExtendedInput.dart';

class ProfileInfo extends StatefulWidget {

  const ProfileInfo({
    super.key,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {

  Key _k1 = new UniqueKey();
  Key _k2 = new UniqueKey();
  Key _k3 = new UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(top: 10, bottom: 8),
        //   child: Text(
        //     'Основные',
        //     textAlign: TextAlign.start,
        //     style: TextStyle(
        //         color: Colors.black.withOpacity(0.6),
        //         fontSize: 24,
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Inter'
        //     ),
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(20, 20, 20, 0.8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              ExtendedInput(value: 'Иван', title: 'Имя', key: _k1),
              Divider(height: 1, color: Colors.white.withOpacity(0.6)),
              ExtendedInput(value: '11.11.1999', title: 'Дата рождения', key: _k2),
              Divider(height: 1, color: Colors.white.withOpacity(0.6)),
              ExtendedInput(value: null, title: 'Пол', key: _k3),
            ],
          ),
        ),
      ],
    );
  }
}