
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';

import '../components/Common/Buttons/buttons.dart';
import '../components/Filters/filters.dart';

class Filters extends StatefulWidget {
  const Filters({super.key});

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
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
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 40),
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
              Container(
                child: Column(
                  children: [
                    GenderSelectButtonGroup(),
                    SizedBox(height: 30),
                    RangeAgeSlider(),
                    SizedBox(height: 30),
                    RangeDistanceSlider()
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
                  const DefaultElevatedButton(text: 'Сохранить', action: 'tape', width: 270, height: 40),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

