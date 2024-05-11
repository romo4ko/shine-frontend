import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/data/api/api_service.dart';
import '../components/Common/Buttons/buttons.dart';
import '../components/Common/Inputs/inputs.dart';
import '../components/Dialogs/DefaultDialog.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstPasswordController = TextEditingController();
  final TextEditingController secondPasswordController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  var api = ApiService();

  register() {
    if (firstPasswordController.text == secondPasswordController.text) {
      api.register({
        'email': emailController.text,
        'password': firstPasswordController.text,
        'birthdate': birthdateController.text
      }).then((data) =>
      {
        if (data['id'] != null) {
          Navigator.pushNamed(context, 'purpose')
        }
        else
          {
            DefaultDialog.showCustomDialog(context, title: 'Ошибка регистрации')
          }
      }).catchError((error) =>
      {
        DefaultDialog.showCustomDialog(context, title: 'Ошибка регистрации')
      });
    }
  }

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
                child: Column(
                  children: [
                    UnderlineTextField(text: 'Ваш Email', controller: emailController),
                    SizedBox(height: 20),
                    UnderlinePasswordField(text: 'Пароль', controller: firstPasswordController),
                    SizedBox(height: 20),
                    UnderlinePasswordField(text: 'Подтвердите пароль', controller: secondPasswordController),
                    SizedBox(height: 20),
                    UnderlineBirthdateField(text: 'Дата рождения', controller: birthdateController),
                  ],
                ),
              ),
              DefaultElevatedButton(
                  text: 'Регистрация',
                  action: () => {
                    register()
                  },
                  width: 270, height: 40
              ),
            ],
          ),
        ),
      ),
    );
  }
}