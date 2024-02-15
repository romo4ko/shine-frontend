import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/Buttons/buttons.dart';
import '../components/Common/Inputs/inputs.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "ЗАРЕГИСТРИРОВАТЬСЯ"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 60),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/register-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: const Column(
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
              ),
              const DefaultElevatedButton(text: 'Регистрация', action: 'purpose', width: 270, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}