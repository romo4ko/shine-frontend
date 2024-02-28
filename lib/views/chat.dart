
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Chat/ChatAppBar.dart';
import 'package:shine/models/ChatModel.dart';
import '../components/Common/BottomBar.dart';

class Chat extends StatefulWidget {

  final int? chat_id;

  static const routeName = 'chat';

  const Chat({super.key, this.chat_id});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  ChatModel chat = ChatModel.fromJson({
      'chat_id': 0,
      'user_id': 0,
      'self_id': 1,
      'user_name': 'Ника',
      'image': 'https://uprostim.com/wp-content/uploads/2021/03/image070-58.jpg',
      'is_online': true,
      'messages': [
        {
          'sender_id': 0,
          'text': 'Добрый день, сегодня хотелось бы выпить чашечку кофе',
          'time': '14:00'
        },
        {
          'sender_id': 1,
          'text': 'Привет',
          'time': '14:01'
        },
        {
          'sender_id': 1,
          'text': 'Да, мне нравится эта идея',
          'time': '14:01'
        },
        {
          'sender_id': 1,
          'text': 'Давай встретимся возле парка в 18:00?',
          'time': '14:05'
        },
        {
          'sender_id': 0,
          'text': 'Отлично! До встречи)',
          'time': '14:10'
        },
      ]
    });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as Chat;

    getMessageDirection(sender_id, user_id) {
      if (sender_id == chat.user_id) {
        return true;
      }
      return false;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: ChatAppBar(chat: chat),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width
            ),
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgrounds/info-bg.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: chat.messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: chat.messages[index].sender_id == chat.user_id ? Alignment.topLeft : Alignment.topRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // margin: EdgeInsets.only(
                          //   bottom: 10,
                          //   left: chat.messages[index].sender_id == chat.user_id ? 0 : 80,
                          //   right: chat.messages[index].sender_id == chat.user_id ? 80 : 0
                          // ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(chat.messages[index].sender_id == chat.user_id ? 10 : 20),
                              bottomLeft: Radius.circular(chat.messages[index].sender_id == chat.user_id ? 0 : 20),
                              topRight: Radius.circular(chat.messages[index].sender_id == chat.user_id ? 20 : 10),
                              bottomRight: Radius.circular(chat.messages[index].sender_id == chat.user_id ? 20 : 0),
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 8,
                                bottom: 8,
                            ),
                            child: Text(
                                chat.messages[index].text,
                            ),
                          )
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 3, bottom: 5),
                          child: Text(
                            chat.messages[index].time,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              color: Colors.black.withOpacity(0.4),
                            ),
                            textAlign: chat.messages[index].sender_id == chat.user_id ? TextAlign.end : TextAlign.start,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const BottomBar(active: "chats"),
          )
        ],
      ),
    );
  }
}
