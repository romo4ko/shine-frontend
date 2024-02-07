
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/BottomBar.dart';

class Tape extends StatefulWidget {
  const Tape({super.key});

  @override
  State<Tape> createState() => _TapeState();
}

class _TapeState extends State<Tape> {

  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child: const Text('1'),
      color: Colors.blue,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('2'),
      color: Colors.red,
    ),
    Container(
      alignment: Alignment.center,
      child: const Text('3'),
      color: Colors.purple,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "С И Я Н И Е", titleSize: 32),
      body: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width
        ),
        padding: const EdgeInsets.only(top: 80, left: 5, right: 5, bottom: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/tape-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Flexible(
          child: CardSwiper(
            cardsCount: cards.length,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(active: "tape"),
    );
  }
}
