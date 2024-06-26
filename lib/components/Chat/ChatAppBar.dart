
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/models/ChatModel.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {

  final ChatModel? chat;

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
                offset: const Offset(
                  0,
                  -30,
                ),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'chats');
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
                      backgroundImage: chat != null ? NetworkImage(
                          chat!.image
                      ) : null,
                      maxRadius: 25,
                    ),
                  ),
                  chat != null ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chat!.user_name,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          height: 1,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        chat!.is_online ? 'в сети' : '',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ],
                  ) : Container()
                ],
              ),
              InkWell(
                onTap: () {
                  ChatActionsDialog.showCustomDialog(context);
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


class ChatActionsDialog {
  static ChatActionsDialog _instance = new ChatActionsDialog.internal();

  ChatActionsDialog.internal();

  factory ChatActionsDialog() => _instance;

  static void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.transparent,
          alignment: Alignment.topRight,
          insetPadding: EdgeInsets.only(right: 10, top: 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: const DecorationImage(
                image: AssetImage("assets/images/backgrounds/modal-bg.png"),
                fit: BoxFit.fitHeight,
                opacity: 0.3
              ),
              color: Color.fromRGBO(20, 20, 20, 0.8)
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            height: 120,
            width: 200,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () => {

                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      backgroundColor: Colors.white.withOpacity(0.4),
                      foregroundColor: Colors.white.withOpacity(0.5),
                      disabledBackgroundColor: Colors.white.withOpacity(1),
                    ),
                    child: const Text(
                      "Пожаловаться",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  width: 230,
                  child: ElevatedButton(
                    onPressed: () => {

                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      backgroundColor: Colors.white.withOpacity(0.4),
                      foregroundColor: Colors.white.withOpacity(0.5),
                      disabledBackgroundColor: Colors.white.withOpacity(1),
                    ),
                    child: const Text(
                      "Заблокировать",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        );
      }
    );
  }
}
