
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/components/Common/Dropdowns/ExtendedDropdown.dart';
import 'package:shine/components/Common/Inputs/TextInput.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';
import 'package:shine/components/ProfileSettings/HideProfile.dart';
import 'package:shine/components/ProfileSettings/ImagesGrid.dart';
import 'package:shine/components/ProfileSettings/ProfileDescription.dart';
import 'package:shine/components/ProfileSettings/ProfileInfo.dart';
import 'package:shine/components/Common/Inputs/TextInput.dart';
import 'package:shine/data/api/api_service.dart';
import '../components/Common/AppBar/DefaultAppBar.dart';
import '../models/Self.dart';
import '../components/ProfileSettings/ProfileSettingsFilled.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  var user;

  final TextEditingController _purpose = TextEditingController();
  final TextEditingController _fs = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _text = TextEditingController();
  final TextEditingController _children = TextEditingController();
  final TextEditingController _alcohol = TextEditingController();
  final TextEditingController _smoking = TextEditingController();
  final TextEditingController _education = TextEditingController();
  final TextEditingController _height = TextEditingController();

  var api = ApiService();
  var loading = true;

  fetchUser() {
    setState(() {
      loading = true;
    });
    api.getCurrentUser().then((data) {
      print(data);
      user = Self.fromJson(data);
      setState(() {
        loading = false;
      });
    });
  }

  save(dynamic data) {
    api.updateUserProperties(data).then((data) => {
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
  void initState() {
    super.initState();
    fetchUser();
  }

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
          child: loading ? CustomProgressIndicator() : Column(
            children: [
              ProfileSettingsFilled(percent: user.profile_filled ?? 0),
              ImagesGrid(images: user.images),
              const SizedBox(height: 20),
              ProfileInfo(user: user),
              const SizedBox(height: 20),
              ProfileDescription(
                  text: user.text,
                  controller: _text,
                  callback: () => { save({'text': _text.text}) }
              ),
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
                      child: ExtendedDropdown(
                          items: const {
                            'dates': 'Свидания',
                            'flirting': 'Флирт',
                            'relationship': 'Отношения',
                            'friendship': 'Дружба',
                            'virtual': 'Виртуальное общение',
                          },
                          title: 'Цель знакомства',
                          selected: user.purpose,
                          controller: _purpose,
                          callback: () => { save({'purpose': _purpose.text}) }
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
                          // const ExtendedDropdown(
                          //   values: ['Ростов-на-Дону', 'Москва', 'Краснодар', 'Санкт-Петербург'],
                          //   title: 'Город',
                          //   selected: 'Ростов-на-Дону',
                          // ),
                          // Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          ExtendedDropdown(
                              items: const {
                                'married': 'Женат/замужем',
                                'single': 'Свободен/свободна',
                                'open-rel': 'В свободных отношениях'
                              },
                              title: 'Семейное положение',
                              selected: user.fs,
                              controller: _fs,
                              callback: () => { save({'fs': _fs.text}) },
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          ExtendedDropdown(
                            items: const {
                              'yes': 'Да',
                              'no': 'Нет и не планирую',
                              'would': 'Нет, но хотелось бы'
                            },
                            title: 'Дети',
                            selected: user.children,
                            controller: _children,
                            callback: () => { save({'children': _children.text}) },
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          TextInput(
                            title: 'Рост',
                            controller: _height,
                            value: user.height.toString(),
                            callback: () => { save({'height': _height.text}) },
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          ExtendedDropdown(
                            items: const {
                              'without': 'Нет',
                              'secondary': 'Среднее',
                              'higher': 'Высшее',
                              'phd': 'Кандидат наук'
                            },
                            title: 'Образование',
                            selected: user.education,
                            controller: _education,
                            callback: () => { save({'education': _education.text}) },
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          // TODO: Tags
                          ExtendedDropdown(
                            items: const {
                              'smoking_negative': 'Резко негативно',
                              'smoking_neutral': 'Нейтрально',
                              'smoking_positive': 'Положительно',
                            },
                            title: 'Отношение к курению',
                            selected: user.smoking,
                            controller: _smoking,
                            callback: () => { save({'smoking': _smoking.text}) },
                          ),
                          Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                          ExtendedDropdown(
                            items: const {
                              'alcohol_negative': 'Резко негативно',
                              'alcohol_neutral': 'Нейтрально',
                              'alcohol_positive': 'Положительно'
                            },
                            title: 'Отношение к алкоголю',
                            selected: user.alcohol,
                            controller: _alcohol,
                            callback: () => { save({'alcohol': _alcohol.text}) },
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 50,),
                  HideProfile(isHidden: !user.active)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
