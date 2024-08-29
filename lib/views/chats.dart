
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/TransparentAppBar.dart';
import 'package:shine/data/api/api_service.dart';
import 'package:shine/models/ChatItemModel.dart';
import 'package:shine/components/Chats/ChatItem.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import '../components/Common/BottomBar.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  var api = ApiService();
  var loading = true;

  List<ChatItemModel> chats = [];

  @override
  void initState() {
    super.initState();
    fetchChats();
  }

  fetchChats() {
    setState(() {
      loading = true;
    });
    api.chats().then((data) {
      for (var data in data['data']) {
        chats.add(
            ChatItemModel.fromJson(data)
        );
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/backgrounds/chats-bg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            appBar: const TransparentAppBar(title: 'Ч А Т Ы'),
            body: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: ShaderMask(
                      shaderCallback: (Rect rect) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.center,
                          colors: [Colors.black, Colors.transparent],
                          stops: [0.0, 0.3],
                        ).createShader(rect);
                      },
                      blendMode: BlendMode.dstOut,
                      child: loading ? CustomProgressIndicator() :
                        chats.isNotEmpty ?
                        ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 100, bottom: 100),
                          itemCount: chats.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ChatItem(chat: chats[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                        )
                        : const Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50),
                            child: Text(
                                "Список пуст",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontFamily: 'Montserrat',
                                ),
                            ),
                          )
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const BottomBar(active: "chats"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
