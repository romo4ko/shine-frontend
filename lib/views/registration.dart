import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/DefaultAppBar.dart';
import 'package:shine/components/Buttons/DefaultElevatedButton.dart';
import 'package:shine/components/Inputs/UnderlineTextField.dart';
import 'package:shine/components/Inputs/UnderlinePasswordField.dart';
import 'package:shine/components/Inputs/UnderlineBirthdateField.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DefaultAppBar(title: "ЗАРЕГИСТРИРОВАТЬСЯ"),
      body: Container(
        padding: const EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 60),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                UnderlineTextField(text: 'Логин'),
                SizedBox(height: 20),
                UnderlineTextField(text: 'Ваш Email'),
                SizedBox(height: 20),
                UnderlinePasswordField(text: 'Пароль'),
                SizedBox(height: 20),
                UnderlinePasswordField(text: 'Подтвердите пароль'),
                SizedBox(height: 20),
                UnderlineBirthdateField(text: 'Дата рождения'),
              ],
            ),
            DefaultElevatedButton(text: 'Регистрация', action: 'login', width: 270, height: 40),
          ],
        ),
      ),
    );
  }
}