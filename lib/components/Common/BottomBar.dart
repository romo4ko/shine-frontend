import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {

  final String active;
  final Color currentColor = Colors.white;
  final Color activeColor = Colors.pink;

  const BottomBar({
    super.key,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 100,
      padding: EdgeInsets.all(0),
      color: Colors.black,
      elevation: 10,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/main-bottom-bar-bg.png"),
            fit: BoxFit.cover,
          )
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
                    color: Colors.white
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'bot');
              },
              child: Container(
                width: (MediaQuery.of(context).size.width)/5,
                child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    height: 40,
                    color: Colors.white
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: (MediaQuery.of(context).size.width)/5,
                child: SvgPicture.asset(
                    'assets/icons/cards.svg',
                    height: 80,
                    color: Colors.white
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: (MediaQuery.of(context).size.width)/5,
                child: SvgPicture.asset(
                    'assets/icons/chats.svg',
                    height: 40,
                    color: active == "profile" ? activeColor : currentColor,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
