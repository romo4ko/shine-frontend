
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Buttons/OptionElevatedButton.dart';
import 'package:shine/components/DefaultAppBar.dart';
import 'package:shine/components/Inputs/FilledTextField.dart';
import 'package:shine/components/Dropdowns/DefaultDropdown.dart';

import '../components/Buttons/DefaultElevatedButton.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "ОСНОВНАЯ  ИНФОРМАЦИЯ"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/info-bg.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FilledTextField(title: 'Как вас зовут?', placeholder: 'Имя'),
                  SizedBox(height: 20),
                  FilledTextField(title: 'Местоположение', placeholder: 'Укажите город для поиска'),
                  SizedBox(height: 20),
                  DefaultDropdown(values: [
                    "Женат/замужем",
                    "Свободен/свободна",
                    "В свободных отношениях"
                  ],
                    title: 'Семейное положение',
                    placeholder: 'Выбрать семейное положение '
                  ),
                  SizedBox(height: 20),
                  DefaultDropdown(values: [
                    "Женат/замужем",
                    "Свободен/свободна",
                    "В свободных отношениях"
                  ],
                    title: 'У вас есть дети?',
                  ),
                  SizedBox(height: 20),
                  DefaultDropdown(values: [
                    "Женат/замужем",
                    "Свободен/свободна",
                    "В свободных отношениях"
                  ],
                    title: 'Алкоголь?',
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 8, right: 4, bottom: 20, top: 50),
                child: Text(
                  "За заполнение всех пунктов профиля ты сияешь ярче всех в ленте.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'kistyac',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
              DefaultElevatedButton(text: 'Сохранить', action: 'purpose', width: 270, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

