
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';

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
              Navigator.pushNamed(context, 'tape');
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
              Navigator.pushNamed(context, 'chats');
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
