
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Chat/ChatAppBar.dart';
import 'package:shine/data/api/api_service.dart';
import 'package:shine/models/ChatModel.dart';
import '../components/Chat/ChatBottomBar.dart';

class Chat extends StatefulWidget {

  final int? chat_id;

  static const routeName = 'chat';

  const Chat({super.key, this.chat_id});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  var api = ApiService();
  var loading = true;

  var chat;

  fetchChat() {
    setState(() {
      loading = true;
    });
    var data = {
      'chat_id': widget.chat_id ?? 0
    };
    api.chat(data).then((response) {
      if (response['data'] != null) {
        chat = ChatModel.fromJson(response['data']);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    fetchChat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScrollController _scrollController = new ScrollController();
    TextEditingController text = TextEditingController();

    sendMessage() {
      var data = {
        'text': text.text,
      };

      api.sendMessage(data).then((response) {
        if (response != null) {
          print(response);
        }
        setState(() {
          loading = false;
        });
      });
    }

    return Stack(
      children: [
        Image.asset(
          "assets/images/backgrounds/info-bg.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: true,
          appBar: ChatAppBar(chat: chat),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  alignment: Alignment.topCenter,
                  child: loading ? Center(
                    child: CircularProgressIndicator(
                        color: Colors.white.withOpacity(0.8)),
                    ) : ListView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 100, bottom: 60),
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
                                  // bottomLeft: is_last ? Radius.circular(is_sender ? 0 : 20) : Radius.circular(is_sender ? 10 : 20),
                                  bottomLeft: is_last ? Radius.circular(is_sender ? 10 : 20) : Radius.circular(is_sender ? 10 : 20),
                                  topRight: Radius.circular(is_sender ? 20 : 10),
                                  // bottomRight: is_last ? Radius.circular(is_sender ? 20 : 0) : Radius.circular(is_sender ? 20 : 10),
                                  bottomRight: is_last ? Radius.circular(is_sender ? 20 : 10) : Radius.circular(is_sender ? 20 : 10),
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
                            // if (is_last) Container(
                            //     alignment: is_sender ? Alignment.bottomLeft : Alignment.bottomRight,
                            //     child: CustomPaint(painter: Triangle(is_sender))
                            // ),
                            const SizedBox(height: 10)
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: ChatBottomBar(active: "chats", controller: text),
              )
            ],
          ),
        ),
      ],
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
