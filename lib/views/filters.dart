
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/data/api/api_service.dart';

import '../components/Common/Buttons/buttons.dart';
import '../components/Filters/filters.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {

  final TextEditingController _gender = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final TextEditingController _distance = TextEditingController();
  var _available = [];

  var api = ApiService();
  var loading = true;

  send() {
    api.setFilter({
      'gender': _gender.text,
      'age': {
        'from': _age.text.split(':')[0],
        'to': _age.text.split(':')[1],
      },
      'destiny': {
        'from': _distance.text.split(':')[0],
        'to': _distance.text.split(':')[1],
      },
    });
    Navigator.pushNamed(context, 'tape');
  }

  getFilter() {
    api.getFilter().then((data) {
      print(data);
      if (data['filter'] != null) {
        _gender.text = data['filter']['gender'] ?? 'all';
        _age.text = "${data['filter']['age']['from']}:${data['filter']['age']['to']}";
        _distance.text = "${data['filter']['destiny']['from']}:${data['filter']['destiny']['to']}";
      }
      _available = data['available'];
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    getFilter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "ФИЛЬТРЫ"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 140, left: 20, right: 20, bottom: 40),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/filters-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loading ? CustomProgressIndicator() : Container(
                child: Column(
                  children: [
                    _available.length > 1 ? GenderSelectButtonGroup(controller: _gender, available: _available) : SizedBox(),
                    _available.length > 1 ? SizedBox(height: 30) : SizedBox(),
                    RangeAgeSlider(controller: _age),
                    SizedBox(height: 30),
                    RangeDistanceSlider(controller: _distance)
                   ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 4, bottom: 20),
                    child: Text(
                      "Найди свою половинку, не потеряв себя в фильтрах!",
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
                  DefaultElevatedButton(text: 'Сохранить', action: () => {send()}, width: 270, height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

