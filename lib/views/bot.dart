
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';

class Bot extends StatefulWidget {
  const Bot({super.key});

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {

  var isShow = false;

  var predictions = [

  "Не дай свайпам управлять тобой, управляй ими сам!",

  "Свайпай с умом, чтобы не пожалеть потом!",

  "Каждый свайп - это новая возможность найти то, что ищешь!",

  "Свайпай, чтобы расширить свой кругозор и узнать что-то новое!",

  "Свайпай с уверенностью и верой в свои возможности!",

  ];

  getPrediction() {
    return predictions[
      Random().nextInt(predictions.length)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "С И Я Н И Е", titleSize: 32),
      body: GestureDetector(
        onTap: (() => {
          setState(() => isShow = !isShow
          )
        }),
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/bot-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text(
                !isShow ? "тык на экран\nи узнай свою\nсудьбу на\nдень" : getPrediction(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1,
                  fontFamily: 'kistyac',
                  fontSize: 36,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                  shadows: const <Shadow>[
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                    Shadow(
                      offset: Offset(0, 4),
                      blurRadius: 4.0,
                      color: Color.fromRGBO(0, 0, 0, 0.25),
                    ),
                  ],
                ),
              ),
            ),
          )
        ),
      ),
    );
  }
}

