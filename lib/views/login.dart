
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/Buttons/buttons.dart';
import '../components/Common/Inputs/inputs.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              const Column(
                children: [
                  UnderlineTextField(text: 'Ваш Email'),
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
              DefaultElevatedButton(text: 'Войти', action: () => {Navigator.pushNamed(context, 'purpose')}, width: 270, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

