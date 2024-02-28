
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/models/ChatModel.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {

  final ChatModel chat;

  const ChatAppBar({
    super.key,
    required this.chat
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(1),
                blurRadius: 50.0,
                spreadRadius: 50,
                offset: Offset(
                  0,
                  -30,
                ),
              )],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: SvgPicture.asset('assets/icons/arrow-back.svg', width: 12),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          chat.image
                      ),
                      maxRadius: 25,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat.user_name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        chat.is_online ? 'в сети' : '',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SvgPicture.asset('assets/icons/options.svg', width: 50),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}