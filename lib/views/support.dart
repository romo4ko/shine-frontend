

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/components/Common/Buttons/buttons.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';
import 'package:shine/components/Information/information.dart';
import 'package:shine/data/api/api_service.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {

  @override
  void initState() {
    super.initState();
  }

  var api = ApiService();
  TextEditingController controller = TextEditingController();

  send() {
    if (controller.text.isNotEmpty) {
      api.support({'text': controller.text}).then((value) => {
        DefaultDialog.showCustomDialog(context, title: 'Спасибо! Ответ прийдёт Вам на почту.')
      });
    } else {
      DefaultDialog.showCustomDialog(context, title: 'Пожалуйста, напишите что-нибудь');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: const DefaultAppBar(title: 'СООБЩИТЬ О ПРОБЛЕМЕ'),
        body: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery
                  .of(context)
                  .size
                  .height,
              minWidth: MediaQuery
                  .of(context)
                  .size
                  .width),
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/likes-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "Если вы обнаружили баги в приложении,"
                  " или у вас есть идеи по его улучшению,"
                  " либо вы хотите задать вопрос,"
                  " пожалуйста, напишите нам! ",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextArea(
                      title: '',
                      placeholder: 'Текст обращения',
                      controller: controller
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: DefaultElevatedButton(text: 'Отправить', action: () => {send()}),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}