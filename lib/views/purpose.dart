
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/Buttons/buttons.dart';

class Purpose extends StatefulWidget {
  const Purpose({super.key});

  @override
  State<Purpose> createState() => _PurposeState();
}

class _PurposeState extends State<Purpose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "ЦЕЛЬ ЗНАКОМСТВА"),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 150),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/purpose-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  children: [
                    OptionElevatedButton(text: 'Свидания', action: 'information', width: 350, height: 40, aligment: Alignment.centerLeft),
                    SizedBox(height: 20),
                    OptionElevatedButton(text: 'Флирт', action: 'information', width: 350, height: 40, aligment: Alignment.centerLeft),
                    SizedBox(height: 20),
                    OptionElevatedButton(text: 'Отношения', action: 'information', width: 350, height: 40, aligment: Alignment.centerLeft),
                    SizedBox(height: 20),
                    OptionElevatedButton(text: 'Дружба', action: 'information', width: 350, height: 40, aligment: Alignment.centerLeft),
                    SizedBox(height: 20),
                    OptionElevatedButton(text: 'Виртуальное общение', action: 'information', width: 350, height: 40, aligment: Alignment.centerLeft),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bottom-shadow.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                      child: Text(
                        "Ваши цели смогут увидеть только те люди, у которых так же указаны цели.",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

