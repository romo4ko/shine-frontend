import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserCard extends StatefulWidget {

  final user;

  const UserCard({
    super.key,
    required this.user
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          image: AssetImage("assets/images/test/test-user.png"),
          fit: BoxFit.cover,
        ),
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "${widget.user['name']}, ${widget.user['age']}",
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                    ),
                ),
                Text(
                  widget.user['distance'],
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text(
                    widget.user['text'],
                    style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 100),
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 60.0,
                  spreadRadius: 60,
                  offset: Offset(
                    0,
                    -30,
                  ),
                ),
                BoxShadow(
                  offset: Offset(0, 30),
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
                    Navigator.pushNamed(context, 'likes');
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
                    Navigator.pushNamed(context, 'profile');
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
          ),
        ],
      ),
    );
  }
}
