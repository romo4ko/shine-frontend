
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
      'is_viewed_by_user': true,
      'messages': [
        {
          'sender_id': 0,
          'text': 'Добрый день, как ты смотришь на то, чтобы сегодня вместе выпить кофе?',
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
                  bool is_sender = chat.messages[index].sender_id == chat.user_id;
                  bool is_last;
                  if (chat.messages.length == index+1) {
                    is_last = true;
                  } else if (chat.messages[index+1].sender_id != chat.messages[index].sender_id) {
                    is_last = true;
                  } else {
                    is_last = false;
                  }
                  return Align(
                    alignment: is_sender ? Alignment.topLeft : Alignment.topRight,
                    child: Column(
                      crossAxisAlignment: is_sender ? CrossAxisAlignment.start : CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            // bottom: 10,
                            left: is_sender ? 0 : 50,
                            right: is_sender ? 50 : 0
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(is_sender ? 10 : 20),
                              bottomLeft: is_last ? Radius.circular(is_sender ? 0 : 20) : Radius.circular(is_sender ? 10 : 20),
                              topRight: Radius.circular(is_sender ? 20 : 10),
                              bottomRight: is_last ? Radius.circular(is_sender ? 20 : 0) : Radius.circular(is_sender ? 20 : 10),
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12,
                                right: 12,
                                top: 8,
                                bottom: 8,
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Text.rich(
                                  TextSpan(children: [
                                    TextSpan(
                                      text: chat.messages[index].text,
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                    // TODO: remove this crutch (transparent text for padding time and is_viewed marks
                                    TextSpan(
                                      text: (!is_sender && chat.is_viewed_by_user) ? '000-00:00' : '-00:00',
                                      style: const TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 10,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ])
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: !is_sender && chat.is_viewed_by_user ? 18 : 0),
                                  child: Text(
                                    chat.messages[index].time,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 10,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ),
                                ),
                                if (!is_sender && chat.is_viewed_by_user) Container(
                                  child: SvgPicture.asset('assets/icons/seen.svg', width: 15),
                                )
                              ],
                            )
                          )
                        ),
                        if (is_last) Container(
                            alignment: is_sender ? Alignment.bottomLeft : Alignment.bottomRight,
                            child: CustomPaint(painter: Triangle(is_sender))
                        ),
                        SizedBox(height: 10,)
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

class Triangle extends CustomPainter {
  final bool is_sender;
  Triangle(this.is_sender);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Colors.white;
    double width = 12;
    double height = 11;

    var path = Path();
    if (is_sender) {
      path.lineTo(0, width);
      path.lineTo(0, width);
      path.lineTo(height, 0);
    }
    else {
      path.lineTo(width, 0); // Side of top right rectangle
      path.lineTo(- width, 0); // Side of top left rectangle
      path.lineTo(0, height); // Side of bottom rectangle
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
