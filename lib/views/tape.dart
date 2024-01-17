
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Buttons/OptionElevatedButton.dart';
import 'package:shine/components/DefaultAppBar.dart';
import 'package:shine/components/Buttons/DefaultElevatedButton.dart';
import 'package:shine/components/Inputs/UnderlineTextField.dart';
import 'package:shine/components/Inputs/UnderlinePasswordField.dart';

class Tape extends StatefulWidget {
  const Tape({super.key});

  @override
  State<Tape> createState() => _TapeState();
}

class _TapeState extends State<Tape> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: const DefaultAppBar(title: "ЦЕЛЬ ЗНАКОМСТВА"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 150, left: 20, right: 20, bottom: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/purpose-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  OptionElevatedButton(text: 'Свидание', action: '', width: 350, height: 40, aligment: Alignment.centerLeft),
                  SizedBox(height: 20),
                  OptionElevatedButton(text: 'Флирт', action: '', width: 350, height: 40, aligment: Alignment.centerLeft),
                  SizedBox(height: 20),
                  OptionElevatedButton(text: 'Отношения', action: '', width: 350, height: 40, aligment: Alignment.centerLeft),
                  SizedBox(height: 20),
                  OptionElevatedButton(text: 'Дружба', action: '', width: 350, height: 40, aligment: Alignment.centerLeft),
                  SizedBox(height: 20),
                  OptionElevatedButton(text: 'Виртуальное общение', action: '', width: 350, height: 40, aligment: Alignment.centerLeft),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Ваши цели смогут увидеть только те люди, у которых указаны такие же цели.",
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
            ],
          ),
        ),
      ),
    );
  }
}

