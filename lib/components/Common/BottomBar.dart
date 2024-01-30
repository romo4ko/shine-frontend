import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBar extends StatelessWidget {

  final String active;
  final Color currentColor = Colors.pink;
  final Color activeColor = Colors.white;

  const BottomBar({
    super.key,
    required this.active
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.all(0),
      color: Colors.black,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: SvgPicture.asset(
                    'assets/icons/star-bot.svg',
                    width: 50,
                    color: Colors.white
                ),
              ),
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.chat,
                color: active == "chat" ? activeColor : currentColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'chat');
              },
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.filter_alt_rounded,
                color: active == "filters" ? activeColor : currentColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'filters');
              },
            ),
            IconButton(
              iconSize: 40,
              icon: Icon(
                Icons.person,
                color: active == "profile" ? activeColor : currentColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'profile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
