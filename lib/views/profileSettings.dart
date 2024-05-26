
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/Dropdowns/ExtendedDropdown.dart';
import 'package:shine/components/Common/Inputs/TextInput.dart';
import 'package:shine/components/ProfileSettings/HideProfile.dart';
import 'package:shine/components/ProfileSettings/ImagesGrid.dart';
import 'package:shine/components/ProfileSettings/ProfileDescription.dart';
import 'package:shine/components/ProfileSettings/ProfileInfo.dart';
import 'package:shine/components/Common/Inputs/TextInput.dart';
import '../components/Common/AppBar/DefaultAppBar.dart';
import '../models/Self.dart';
import '../components/ProfileSettings/ProfileSettingsFilled.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  Self user = Self.fromJson({
    'id': 1,
    'name': 'Александр',
    'age': 25,
    'sex': 'мужской',
    'birthdate': '11.11.1999',
    'city': 'Ростов-на-Дону',
    'purpose': 'Свидания',
    'image': "https://avatars.dzeninfra.ru/get-zen_doc/29030/pub_5ae9c5fe3dceb76be76eebac_5ae9cad457906a18134a10ad/scale_1200",
    'images': [
      "https://avatars.dzeninfra.ru/get-zen_doc/29030/pub_5ae9c5fe3dceb76be76eebac_5ae9cad457906a18134a10ad/scale_1200",
    ],
    'is_premium': false,
    'bot_setting': 1,
    'profile_filled': 73,
    'invites': 1
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const DefaultAppBar(title: "НАСТРОЙКИ ПРОФИЛЯ", titleSize: 24),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 50),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/profile-settings-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              ProfileSettingsFilled(percent: user.profile_filled ?? 0),
              ImagesGrid(images: user.images),
              const SizedBox(height: 20),
              ProfileInfo(user: user),
              const SizedBox(height: 20),
              const ProfileDescription(),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Для чего я здесь',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(20, 20, 20, 0.8),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: const ExtendedDropdown(
                          values: ['Свидания', 'Флирт', 'Отношения', 'Дружба', 'Виртуальное общение'],
                          title: 'Цель знакомства',
                          selected: 'Свидания',
                      )
                  )
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Основные',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter'
                      ),
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(20, 20, 20, 0.8),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        children: [
                          const ExtendedDropdown(
                            values: ['Ростов-на-Дону', 'Москва', 'Краснодар', 'Санкт-Петербург'],
                            title: 'Город',
                            selected: 'Ростов-на-Дону',
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Женат/замужем', 'Свободен/свободна', 'В свободных отношениях'],
                            title: 'Семейное положение',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Есть', 'Нет, и не планирую', 'Нет, но хотелось бы'],
                            title: 'Дети',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          TextInput(
                            title: 'Рост',
                            value: '',
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Нет', 'Среднее', 'Высшее', 'Неоконченное', 'Кандидат наук'],
                            title: 'Образование',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Свидания', 'Флирт', 'Отношения', 'Дружба', 'Виртуальное общение'],
                            title: 'Хобби/Интересы',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Русский', 'Английский'],
                            title: 'Языки',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Резко негативно', 'Нейтрально', 'Положительно'],
                            title: 'Отношение к алкоголю',
                            selected: null,
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          const ExtendedDropdown(
                            values: ['Резко негативно', 'Нейтрально', 'Положительно'],
                            title: 'Отношение к курению',
                            selected: null,
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 50,),
                  HideProfile(isHidden: user.is_premium)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
