
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/data/api/api_service.dart';

class Bot extends StatefulWidget {
  const Bot({super.key});

  @override
  State<Bot> createState() => _BotState();
}

class _BotState extends State<Bot> {

  var isShow = false;
  bool loading = false;
  var api = ApiService();
  String? prediction;

  getPrediction() {
    setState(() {
      loading = true;
    });
    api.prediction().then((data) => {
      if (data['error'] == null) {
        setState(() {
          prediction = data['text'];
          loading = false;
          isShow = !isShow;
        })
      } else {
        setState(() {
          prediction = 'Оформи премиум, чтобы получать больше предсказаний в день!';
          loading = false;
          isShow = !isShow;
        })
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "С И Я Н И Е", titleSize: 32),
      body: GestureDetector(
        onTap: (() => {
          getPrediction(),
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
                !isShow || loading ? "тык на экран\nи узнай свою\nсудьбу на\nдень" : prediction!,
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

