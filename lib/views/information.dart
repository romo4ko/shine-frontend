
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';

import '../components/Common/Buttons/buttons.dart';
import '../components/Common/Dropdowns/dropdowns.dart';
import 'package:shine/components/Information/information.dart';
import 'package:shine/data/api/api_service.dart';


class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

  var api = ApiService();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _fs = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _children = TextEditingController();
  final TextEditingController _alcohol = TextEditingController();
  final TextEditingController _smoking = TextEditingController();

  save() {
    // TODO: Add images and city check
    if (_name.text.isEmpty || _gender.text.isEmpty) {
      DefaultDialog.showCustomDialog(context, title: 'Пожалуйста, заполните необходимые поля!');
      return 1;
    }
    api.updateUserProperties({
      'name': _name.text,
      'gender': _gender.text,
      'city': _city.text,
      'fs': _fs.text,
      'children': _children.text,
      'smoking': _smoking.text,
      'alcohol': _alcohol.text,
      'text': _description.text,
    }).then((data) => {
      if (data['status'] != null) {
        Navigator.pushNamed(context, 'profile')
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
      appBar: const DefaultAppBar(title: "ОСНОВНАЯ  ИНФОРМАЦИЯ"),
      body: SingleChildScrollView(
        physics : const ClampingScrollPhysics(),
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 40),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/info-bg.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  FilledTextField(
                      title: 'Как вас зовут?*',
                      placeholder: 'Имя',
                      controller: _name
                  ),
                  const SizedBox(height: 20),
                  GenderCheckbox(title: 'Пол*', controller: _gender),
                  const SizedBox(height: 20),
                  CityTextField(
                      title: 'Местоположение*',
                      placeholder: 'Укажите город для поиска',
                      controller: _city
                  ),
                  const SizedBox(height: 20),
                  DefaultDropdown(items: {
                      'married': 'Женат/замужем',
                      'single': 'Свободен/свободна',
                      'open-rel': 'В свободных отношениях'
                    },
                    title: 'Семейное положение',
                    placeholder: 'Выбрать семейное положение',
                    controller: _fs
                  ),
                  const SizedBox(height: 20),
                  DefaultDropdown(items: {
                    'yes': 'Да',
                    'no': 'Нет и не планирую',
                    'would': 'Нет, но хотелось бы'},
                    title: 'У вас есть дети?',
                    controller: _children,
                  ),
                  SizedBox(height: 20),
                  DefaultDropdown(items: {
                      'smoking_negative': 'Резко негативно',
                      'smoking_neutral': 'Нейтрально',
                      'smoking_positive': 'Положительно',
                    },
                    title: 'Как вы относитесь к курению?',
                    controller: _smoking,
                  ),
                  SizedBox(height: 20),
                  DefaultDropdown(items: {
                      'alcohol_negative': 'Резко негативно',
                      'alcohol_neutral': 'Нейтрально',
                      'alcohol_positive': 'Положительно'
                    },
                    title: 'Как вы относитесь к алкоголю?',
                    controller: _alcohol,
                  ),
                  const SizedBox(height: 20),
                  TextArea(
                    title: 'Описание профиля',
                    placeholder: 'Напишите о себе и о своих желаниях',
                    controller: _description
                  ),
                  const SizedBox(height: 20),
                  // TODO: make tags
                  // const TagsArea(
                  //   title: 'Хобби/Интересы',
                  //   placeholder: '#музыка #спорт #рисование #растения #IT #татуировки #искусство #машины #дизайн #еда #кино #театры #фильмы #сериалы',
                  // ),
                  // const SizedBox(height: 20),
                  const ImagesForm(
                    title: 'Ваши фото*',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 4, bottom: 20, top: 50),
                child: Text(
                  "За заполнение всех пунктов профиля ты сияешь ярче всех в ленте.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    height: 1,
                    fontFamily: 'kistyac',
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
              DefaultElevatedButton(text: 'Сохранить', action: () => {save()}, width: 270, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

