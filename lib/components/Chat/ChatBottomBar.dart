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
      height: 60,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(1),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: InkWell(
              onTap: () {
              },
              child: Center(
                child: SizedBox(
                  width: 50,
                  child: SvgPicture.asset(
                    'assets/icons/clip.svg',
                    width: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              color: Colors.black,
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 100,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Inter'
                ),
                cursorColor: Colors.black.withOpacity(0.5),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
          ),
          InkWell(
            onTap: () {
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                'assets/icons/send.svg',
                height: 45,
                alignment: Alignment.center,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

