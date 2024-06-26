

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery
                    .of(context)
                    .size
                    .height,
                minWidth: MediaQuery
                    .of(context)
                    .size
                    .width),
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
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
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/icons/premium-main.svg',
                      height: 170, width: 170),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "О приложении",
                      style: TextStyle(
                          fontFamily: 'Dejavu',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Text(
                      "v1.0",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.w200,
                          color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        "",
                        style: TextStyle(
                            fontFamily: 'Dejavu',
                            fontSize: 20,
                            color: Colors.white.withOpacity(0.8)),
                            textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}