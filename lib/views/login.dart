
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/DefaultAppBar.dart';
import 'package:shine/components/Buttons/DefaultElevatedButton.dart';
import 'package:shine/components/Inputs/UnderlineTextField.dart';
import 'package:shine/components/Inputs/UnderlinePasswordField.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const DefaultAppBar(title: "АВТОРИЗОВАТЬСЯ"),
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
                UnderlinePasswordField(text: 'Пароль'),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Забыли пароль?", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'))
                  ],
                )
              ],
            ),
            DefaultElevatedButton(text: 'Войти', action: 'login', width: 270, height: 40),
          ],
        ),
      ),
    );
  }
}

