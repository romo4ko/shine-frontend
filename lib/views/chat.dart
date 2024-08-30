
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shine/components/Chat/ChatAppBar.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/data/api/api_service.dart';
import 'package:shine/models/ChatModel.dart';
import 'package:shine/models/Message.dart';
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

  final ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? _image;

  List<dynamic> _uploadedImages = [];

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

    scrollMessages() {
      _scrollController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }

    sendMessage() {
      if (text.text.isNotEmpty) {
        var data = {
          'chat_id': chat.chat_id,
          'text': text.text,
        };
        api.sendMessage(data).then((response) {
          if (response['status'] != 'success') {
          }
          setState(() {
            chat.messages.add(
                Message(
                    chat.self_id,
                    text.text,
                    DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
                    null
                )
            );
            scrollMessages();
            text.clear();
          });
        });
      }
    }

    getChatStatus() {
      String? text = null;
      if (chat.status == 'requested') {
        text = 'Пользователь отправил вам запрос на переписку. '
            'Чтобы начать, просто отправьте ответное сообщение.';
      }
      else if (chat.status == 'blocked_by_initiator' || chat.status == 'blocked_by_initiator') {
        text = 'Пользователь ограничил вам отправку сообщений.';
      }

      if (text == null) {
        return SizedBox();
      }
      return Container(
        margin: EdgeInsets.only(top: 100),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.black.withOpacity(0.6),
        ),
        child: Text(
            text,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    uploadImage(XFile image) async {
      var data = {
        'chat_id': chat.chat_id,
        'image': await MultipartFile.fromFile(image.path, filename: image.name),
      };
      await api.sendMessage(data).then((response) {
        if (response['status'] != 'success') {
        }
        if (response['data'] != null) {
          String path = response['data']['path'];

          setState(() {
            chat.messages.add(
                Message(
                    chat.self_id,
                    path,
                    DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString(),
                    response['data']
                )
            );
            scrollMessages();
          });
        }
      });
    }

    Future<XFile?> imagePicker() async {
      XFile? _image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (_image != null) {
        return _image;
      }
      return null;
    }

    pickImage() async {
      _image = await imagePicker();
      if (_image != null) {
        _uploadedImages = [];
        setState(() {});
        await uploadImage(_image!);
      }
    }

    action(type) {
      if (type == 'send') {
        sendMessage();
      }
      else if (type == 'images') {
        pickImage();
      }
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
          appBar: ChatAppBar(chat: chat),
          bottomSheet: ChatBottomBar(
              active: "chats",
              controller: text,
              callback: (type) => {action(type)},
          ),
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              alignment: Alignment.topCenter,
              child: loading ? CustomProgressIndicator()
                  : Column(
                    children: [
                      getChatStatus(),
                      Expanded (
                        child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        reverse: true,
                        controller: _scrollController,
                        child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: chat.status == 'requested' ? 20 : 100, bottom: 70),
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
                                    padding: EdgeInsets.only(
                                        left: chat.messages[index].content == null ? 12 : 8,
                                        right: chat.messages[index].content == null ? 12 : 8,
                                        top: 8,
                                        bottom: chat.messages[index].content == null ? 8 : 5,
                                    ),
                                    child: chat.messages[index].content == null ?
                                    Stack(
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
                                              text: (!is_sender && chat.is_viewed) ? '000-00:00' : '-00:00',
                                              style: const TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 10,
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ])
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(right: !is_sender && chat.is_viewed ? 18 : 0),
                                          child: Text(
                                            chat.messages[index].time,
                                            style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              color: Colors.black.withOpacity(0.4),
                                            ),
                                          ),
                                        ),
                                        if (!is_sender && chat.is_viewed) Container(
                                          child: SvgPicture.asset('assets/icons/seen.svg', width: 15),
                                        )
                                      ],
                                    ) :
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              chat.messages[index].content['path']
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 3),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(right: 5),
                                                child: Text(
                                                  chat.messages[index].time,
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 10,
                                                    color: Colors.black.withOpacity(0.4),
                                                  ),
                                                ),
                                              ),
                                              if (!is_sender && chat.is_viewed) Container(
                                                child: SvgPicture.asset('assets/icons/seen.svg', width: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  )
                                ),
                                const SizedBox(height: 10)
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
