import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {

  final String active;
  final Color currentColor = Colors.white;
  final Color activeColor = const Color.fromRGBO(249, 178, 8, 1.0);

  const BottomBar({
    super.key,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 40.0,
            spreadRadius: 40,
            offset: const Offset(
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
              Navigator.pushNamed(context, 'bot');
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width)/5,
              child: SvgPicture.asset(
                'assets/icons/star-bot.svg',
                height: 75,
                color: currentColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (active != 'likes') {
                Navigator.pushNamed(context, 'likes');
              }
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width)/5,
              child: SvgPicture.asset(
                'assets/icons/heart.svg',
                height: 40,
                color: active == "likes" ? activeColor : currentColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (active != 'tape') {
                Navigator.pushNamed(context, 'tape');
              }
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width)/5,
              child: SvgPicture.asset(
                'assets/icons/cards.svg',
                height: 80,
                color: active == "tape" ? activeColor : currentColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (active != 'chats') {
                Navigator.pushNamed(context, 'chats');
              }
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width)/5,
              child: SvgPicture.asset(
                'assets/icons/chats.svg',
                height: 40,
                color: active == "chats" ? activeColor : currentColor,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (active != 'profile') {
                Navigator.pushNamed(context, 'profile');
              }
            },
            child: SizedBox(
              width: (MediaQuery.of(context).size.width)/5,
              child: SvgPicture.asset(
                'assets/icons/human.svg',
                height: 40,
                color: active == "profile" ? activeColor : currentColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
