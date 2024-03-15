
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Profile/profile.dart';

import '../components/Common/BottomBar.dart';

class Premium extends StatefulWidget {
  const Premium({super.key});

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width
        ),
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/premium-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset('assets/icons/premium-main.svg', height: 160, width: 160),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "С И Я Н И Е",
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Dejavu',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                const Text(
                  "premium",
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.w200,
                      color: Colors.white
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "приобретай премиум со скидкой и получай больше возможностей сиять",
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'kistyac',
                        fontSize: 22,
                        color: Colors.white.withOpacity(0.8)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(14, 14, 14, 0.8)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text(
                      "Скидка -30%",
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const Text(
                    "7 дней 0 часов 0 минут",
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 105,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.white,
                          width: 1
                      ),
                      color: const Color.fromRGBO(14, 14, 14, 0.8)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Неделя",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                      const Text(
                        "280₽",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      Stack(
                        children: [
                          Text(
                            "400₽",
                            style: TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            width: 40,
                            color: Colors.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 105,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.white,
                          width: 1
                      ),
                      color: const Color.fromRGBO(14, 14, 14, 0.8)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Месяц",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                      const Text(
                        "700₽",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      Stack(
                        children: [
                          Text(
                            "1000₽",
                            style: TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            width: 40,
                            color: Colors.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 105,
                  width: 105,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Colors.white,
                          width: 1
                      ),
                      color: const Color.fromRGBO(14, 14, 14, 0.8)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "3 месяца",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                            color: Colors.white
                        ),
                      ),
                      const Text(
                        "1400₽",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                            color: Colors.white
                        ),
                      ),
                      Stack(
                        children: [
                          Text(
                            "2000₽",
                            style: TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 1,
                            width: 40,
                            color: Colors.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                PremiumOption(
                  title: 'Бот с предсказаниями',
                  description: 'Возможность видеть больше предсказаний в день'
                )
              ],
            )
          ],
        ),
      )
    );
  }
}

class PremiumOption extends StatelessWidget {

  final String title;
  final String? route;
  final String description;

  const PremiumOption({
    super.key,
    required this.title,
    this.route,
    required this.description
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, this.route ?? '/')
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromRGBO(14, 14, 14, 0.8)
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  this.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'
                  ),
                ),
                Text(
                  this.description,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'Montserrat'
                  ),
                ),
              ],
            ),
            SvgPicture.asset('assets/icons/arrow-right.svg', height: 14),
          ],
        ),
      ),
    );
  }
}
