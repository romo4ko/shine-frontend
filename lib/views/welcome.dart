import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../components/Common/Buttons/buttons.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/main-bg.png"),
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
                Column(
                  children: [
                    DefaultElevatedButton(text: 'Вход', action: () => {Navigator.pushNamed(context, 'login')}, width: 270, height: 40),
                    SizedBox(
                      height: 40,
                    ),
                    DefaultElevatedButton(text: 'Регистрация', action: () => {Navigator.pushNamed(context, 'registration')}, width: 270, height: 40),
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