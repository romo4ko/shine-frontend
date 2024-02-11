
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/components/Tape/TapeAppBar.dart';
import 'package:shine/components/Tape/UserCard.dart';
import '../components/Common/BottomBar.dart';

class Tape extends StatefulWidget {
  const Tape({super.key});

  @override
  State<Tape> createState() => _TapeState();
}

class _TapeState extends State<Tape> {

  List users = [
    {
      'id': 0,
      'name': 'Аня',
      'age': 22,
      'text': 'В поисках человека схожего с моими взглядами, интересами и увлечениями. Люблю творчество и уютные вечера',
      'images': [
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000008881.jpg?alt=media&token=cca5f27d-62f1-43c9-93ac-08f786149ecc",
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000011393.jpg?alt=media&token=45a29840-9348-4c88-8cf9-ad5560daba69",
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000011391.jpg?alt=media&token=a93af62b-fb73-4144-9380-ebc7d5428b6b"
      ],
      'distance': '2 км',
      'tags': [
        'Музыка', 'Спорт', 'Дизайн'
      ],
      'sign': 'Телец'
    },
    {
      'id': 1,
      'name': 'Лена',
      'age': 23,
      'text': 'В поисках человека схожего с моими взглядами, интересами и увлечениями. Люблю творчество и уютные вечера. В поисках человека схожего с моими взглядами, интересами и увлечениями. Люблю творчество и уютные вечера. В поисках человека схожего с моими взглядами, интересами и увлечениями. Люблю творчество и уютные вечера',
      'images': [
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000008881.jpg?alt=media&token=cca5f27d-62f1-43c9-93ac-08f786149ecc",
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000011393.jpg?alt=media&token=45a29840-9348-4c88-8cf9-ad5560daba69",
        "https://firebasestorage.googleapis.com/v0/b/candy-fa135.appspot.com/o/files%2F1000011391.jpg?alt=media&token=a93af62b-fb73-4144-9380-ebc7d5428b6b"
      ],
      'distance': '2 км',
      'tags': [
        'Музыка', 'Спорт', 'Дизайн'
      ],
      'sign': 'Телец'
    }
  ];

  final CardSwiperController swipeController = CardSwiperController();

  var cards = [];

  @override
  void dispose() {
    swipeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    createCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const TapeAppBar(title: "С И Я Н И Е", titleSize: 32),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgrounds/tape-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: CardSwiper(
              controller: swipeController,
              cardsCount: cards.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const BottomBar(active: "tape"),
          )
        ],
      ),
    );
  }

  bool _onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
      int? previousIndex,
      int currentIndex,
      CardSwiperDirection direction,
      ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  createCards() {
    for (var user in users) {
      cards.add(
          UserCard(user: user, swipeController: swipeController)
      );
    }
  }
}
