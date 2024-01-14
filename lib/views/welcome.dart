import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Buttons/DefaultElevatedButton.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/main-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "СИЯНИЕ",
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Dejavu',
                          fontSize: 90,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                      ),
                    ),
                    Text(
                      "найди свой свет",
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'kistyac',
                          fontSize: 36,
                          fontWeight: FontWeight.w400,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
                const Column(
                  children: [
                    DefaultElevatedButton(text: 'Вход', action: 'login', width: 270, height: 40),
                    SizedBox(
                      height: 40,
                    ),
                    DefaultElevatedButton(text: 'Регистрация', action: 'registration', width: 270, height: 40),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      Text(
                          'Продолжая пользоваться нашим приложение вы соглашаетесь с политикой конфиденциальности и правилами пользования',
                          style: TextStyle(
                              fontFamily: 'Krub',
                            color: Colors.white,
                              fontSize: 10
                          ),
                          textAlign: TextAlign.center
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                          'Проблемы со входом',
                          style: TextStyle(
                              fontFamily: 'Krub',
                              color: Colors.white,
                              fontSize: 10
                          ),
                          textAlign: TextAlign.center
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}