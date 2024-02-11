import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TapeBottomBar extends StatelessWidget {

  final String active;
  final Color currentColor = Colors.white;
  final Color activeColor = const Color.fromRGBO(249, 178, 8, 1.0);

  const TapeBottomBar({
    super.key,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(0),
      color: Colors.transparent,
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 50.0,
              spreadRadius: 50,
              offset: Offset(
                0,
                0,
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
              child: Container(
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
                Navigator.pushNamed(context, 'likes');
              },
              child: Container(
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
                Navigator.pushNamed(context, 'tape');
              },
              child: Container(
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
                Navigator.pushNamed(context, 'chats');
              },
              child: Container(
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
                Navigator.pushNamed(context, 'profile');
              },
              child: Container(
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
      ),
    );
  }
}
