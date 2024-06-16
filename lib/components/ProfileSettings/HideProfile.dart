
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shine/components/ProfileSettings/ExtendedInput.dart';
import 'package:shine/data/api/api_service.dart';
import '../../models/Self.dart';

class HideProfile extends StatefulWidget {

  final bool isHidden;

  const HideProfile({
    super.key,
    required this.isHidden
  });

  @override
  State<HideProfile> createState() => _HideProfileState();
}

class _HideProfileState extends State<HideProfile> {

  var isEnable;
  var api = ApiService();

  @override
  void initState() {
    isEnable = widget.isHidden ?? false;
    super.initState();
  }

  save() {
    api.updateUserSettings({'active': !isEnable}).then((data) => {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Center(child: Text("Сохранено")),
        duration: Duration(milliseconds: 500),
      ))
    }).catchError((error) => {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Center(child: Text("Ошибка")),
        duration: Duration(milliseconds: 500),
      ))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: Color.fromRGBO(20, 20, 20, 0.8),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Спрятать профиль',
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter'
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    'Чаты и остальные функции будут доступны, но другие пользователи не увидят вашу анкету',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 15,
                        fontFamily: 'Inter'
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Switch(
                      value: isEnable,
                      inactiveTrackColor: Color.fromRGBO(20, 20, 20, 0.8),
                      activeColor: Colors.white,
                      onChanged: (bool value) {
                      setState(() {
                        isEnable = !isEnable;
                        save();
                      });
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}