
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';

import 'package:shine/data/api/api_service.dart';
import 'package:shine/components/Tape/tape.dart';
import '../components/Common/BottomBar.dart';
import '../models/User.dart';

class Tape extends StatefulWidget {
  const Tape({super.key});

  @override
  State<Tape> createState() => _TapeState();
}

class _TapeState extends State<Tape> {

  var api = ApiService();
  var loading = true;

  List<User> users = [];
  var cards = [];

  final CardSwiperController swipeController = CardSwiperController();

  @override
  void dispose() {
    swipeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
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
            child: loading ? CustomProgressIndicator() :
            users.isEmpty ? const Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Text(
                    "Ничего не нашлось",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                )
            ) :
            CardSwiper(
              controller: swipeController,
              cardsCount: cards.length,
              numberOfCardsDisplayed: users.length > 1 ? 2 : users.length,
              onSwipe: _onSwipe,
              onUndo: _onUndo,
              allowedSwipeDirection: const AllowedSwipeDirection.symmetric(horizontal: true),
              backCardOffset: const Offset(0, 0),
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

    if (direction.name == 'right') {
      like(users[previousIndex]);
    }

    if (previousIndex == users.length-1) {
      fetchUsers();
    }
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
    cards.clear();
    for (var user in users) {
      cards.add(
          UserCard(user: user, swipeController: swipeController, key: UniqueKey())
      );
    }
  }

  fetchUsers() async {
    setState(() {
      loading = true;
      users.clear();
    });
    api.getUsers().then((data) {
      for (var user in data['data']) {
        users.add(
            User.fromJson(user)
        );
      }
      setState(() {
        createCards();
        loading = false;
      });
    });
  }

  like(User user) {
    api.like({'whom': user.id}).then((data) {
      if (data['status'] == 'match') {
        DefaultDialog.showCustomDialog(context, title: 'Звёзды сошлись!');
      }
    });
  }
}
