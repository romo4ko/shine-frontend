import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBottomBar extends StatefulWidget {

  final String active;

  const ChatBottomBar({
    super.key,
    required this.active
  });

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 10.0,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'bot');
            },
            child: Center(
              child: SizedBox(
                width: 50,
                child: SvgPicture.asset(
                  'assets/icons/clip.svg',
                  width: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width-100,
            color: Colors.black,
            child: TextFormField(
              style: const TextStyle(color: Colors.black, fontSize: 16, fontFamily: 'Inter'),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelStyle: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontFamily: 'Inter'),
                fillColor: Colors.white,
                filled: true,
                focusColor: Colors.white,
                labelText: "Введите сообщение",
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'profile');
            },
            child: SizedBox(
              width: 50,
              child: SvgPicture.asset(
                'assets/icons/send.svg',
                width: 50,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

