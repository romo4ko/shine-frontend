
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';
import 'package:shine/data/api/api_service.dart';

class CardNavigation extends StatefulWidget {

  final CardSwiperController swipeController;

  const CardNavigation({
    super.key,
    required this.swipeController
  });

  @override
  State<CardNavigation> createState() => _CardNavigationState();
}

class _CardNavigationState extends State<CardNavigation> {

  var api = ApiService();
  var isVip = false;

  send(text) {
    print(text);
    DefaultDialog.showCustomDialog(context, title: 'Отправлено!');
  }

  checkAuth() {
    api.checkAuth().then((data) => {
      if (data['user'] != null) {
        setState(() {
          isVip = data['user']['is_premium'];
        }),
        print(isVip)
      }
    });
  }

  @override
  void initState() {
    checkAuth();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 30.0,
            spreadRadius: 30,
            offset: Offset(
              0,
              30,
            ),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              widget.swipeController.swipe(CardSwiperDirection.left);
            },
            child: Container(
              width: (MediaQuery.of(context).size.width-100)/4,
              child: SvgPicture.asset(
                'assets/icons/dislike.svg',
                height: 50,
                width: 50,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.swipeController.undo();
            },
            child: Container(
              width: (MediaQuery.of(context).size.width-100)/4,
              child: SvgPicture.asset(
                'assets/icons/back-button.svg',
                height: 50,
                width: 50,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if(isVip) {
                DefaultDialog.showCustomDialog(context, title: 'Скоро добавим)');
              } else {
                Navigator.pushNamed(context, 'premium');
              }
            },
            child: Container(
              width: 80,
              child: SvgPicture.asset(
                'assets/icons/star.svg',
                height: 80,
                width: 80,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              DefaultDialog.showFormDialog(
                  context,
                  title: 'Отправить сообщение',
                  action: (text) => { send(text) }
              );
            },
            child: Container(
              width: (MediaQuery.of(context).size.width-100)/4,
              child: SvgPicture.asset(
                'assets/icons/message.svg',
                height: 50,
                width: 50,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              widget.swipeController.swipe(CardSwiperDirection.right);
            },
            child: Container(
              width: (MediaQuery.of(context).size.width-100)/4,
              child: SvgPicture.asset(
                'assets/icons/like.svg',
                height: 50,
                width: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
