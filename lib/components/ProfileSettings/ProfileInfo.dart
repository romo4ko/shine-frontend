
import 'package:flutter/material.dart';
import 'package:shine/components/ProfileSettings/ExtendedInput.dart';
import '../../models/Self.dart';

class ProfileInfo extends StatefulWidget {

  final Self user;

  const ProfileInfo({
    super.key,
    required this.user
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
        Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(20, 20, 20, 0.8),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              ExtendedInput(value: widget.user.name, title: 'Имя', key: _k1, disabled: true),
              Divider(height: 1, color: Colors.white.withOpacity(0.6)),
              ExtendedInput(value: widget.user.birthdate, title: 'Дата рождения', key: _k2, disabled: true),
              Divider(height: 1, color: Colors.white.withOpacity(0.6)),
              ExtendedInput(value: widget.user.sex, title: 'Пол', key: _k3, disabled: true),
            ],
          ),
        ),
      ],
    );
  }
}