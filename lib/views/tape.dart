
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  var response = [
    {
      'id': 0,
      'name': 'Аня',
      'age': 22,
      'text': 'В поисках человека схожего с моими взглядами, интересами и увлечениями. Люблю творчество и уютные вечера',
      'images': [
        "https://bipbap.ru/wp-content/uploads/2015/02/dana-kareglazaya-portret-boke.jpg",
        "https://wp-s.ru/wallpapers/4/2/452110934931644/osennij-portret-s-pronizyvayushhim-vzglyadom-devushki.jpg",
        "https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg"
      ],
      'distance': 2,
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
        "https://bipbap.ru/wp-content/uploads/2015/02/547b9db42203b2d5c16d9dd0f5626207.jpg",
        "https://24warez.ru/uploads/posts/2019-05/270519/392210/f99e9c4d602b-800x1000.jpg",
        "https://interesnoewmire.ru/wp-content/uploads/fotografii-krasivyh-devushek-chast-12-43-foto-45a3348.jpg",
        "https://i.yapx.cc/SGXLz.jpg",
      ],
      'distance': 2,
      'tags': [
        'IT', 'Сериалы', 'Фильмы', 'Спорт', 'Кафе', 'Рестораны'
      ],
      'sign': 'Телец'
    }
  ];

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
              numberOfCardsDisplayed: 2,
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
          UserCard(user: user, swipeController: swipeController, key: UniqueKey())
      );
    }
  }

  fetchUsers() async {
    for (var data in response) {
      users.add(
          User.fromJson(data)
      );
    }
  }
}
