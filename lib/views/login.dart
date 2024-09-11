
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/Buttons/buttons.dart';
import '../components/Common/Inputs/inputs.dart';
import 'package:shine/data/api/api_service.dart';
import '../components/Dialogs/DefaultDialog.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  var api = ApiService();

  login() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
      api.login({
        'email': _email.text,
        'password': _password.text,
      }).then((data) => {
        if (data['token'] != null) {
          localStorage.setString('token', json.encode(data['token'])),
          localStorage.setString('user', json.encode(data['user'])),
          if (data['filled'] == null) {
            Navigator.pushNamed(context, 'profile')
          } else {
              Navigator.pushNamed(context, 'purpose')
          }
        }
        else {
          DefaultDialog.showCustomDialog(context, title: data['error'])
        }
      }).catchError((error) => {
          DefaultDialog.showCustomDialog(context, title: 'Ошибка сети')
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "АВТОРИЗОВАТЬСЯ"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 60),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/login-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  UnderlineTextField(text: 'Ваш Email', controller: _email),
                  const SizedBox(height: 20),
                  UnderlinePasswordField(text: 'Пароль', controller: _password),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Забыли пароль?", style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'))
                    ],
                  )
                ],
              ),
              DefaultElevatedButton(
                  text: 'Войти',
                  action: () => {
                    login()
                  },
                  width: 270,
                  height: 40
              ),
            ],
          ),
        ),
      ),
    );
  }
}

