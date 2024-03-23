
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/TransparentAppBar.dart';
import 'package:shine/models/ChatItemModel.dart';
import 'package:shine/components/Chats/ChatItem.dart';
import '../components/Common/BottomBar.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

  var response = [
    {
      'id': 0,
      'name': 'Ника',
      'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
      'last_message': 'Добрый день, сегодня хотелось бы выпить чашечку кофе',
      'time': '14:00',
      'is_viewed': true
    },
    {
      'id': 1,
      'name': 'Аня',
      'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
      'last_message': 'Увидела твою фотографию и поняла, что любовь с первого взгляда существует',
      'time': '11:00',
      'is_viewed': false
    },
    {
      'id': 2,
      'name': 'Вика',
      'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
      'last_message': 'Привет, тебе больше нравится пасмурная или солнечная погода?',
      'time': '10:50',
      'is_viewed': false
    },
    {
      'id': 3,
      'name': 'Ангелина',
      'image': 'https://i.yapx.cc/SGXLz.jpg',
      'last_message': 'Привет) Познакомимся?',
      'time': '10:00',
      'is_viewed': true
    },
    {
      'id': 0,
      'name': 'Ника',
      'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
      'last_message': 'Добрый день, сегодня хотелось бы выпить чашечку кофе',
      'time': '14:00',
      'is_viewed': true
    },
    {
      'id': 1,
      'name': 'Аня',
      'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
      'last_message': 'Увидела твою фотографию и поняла, что любовь с первого взгляда существует',
      'time': '11:00',
      'is_viewed': false
    },
    {
      'id': 2,
      'name': 'Вика',
      'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
      'last_message': 'Привет, тебе больше нравится пасмурная или солнечная погода?',
      'time': '10:50',
      'is_viewed': false
    },
    {
      'id': 3,
      'name': 'Ангелина',
      'image': 'https://i.yapx.cc/SGXLz.jpg',
      'last_message': 'Привет) Познакомимся?',
      'time': '10:00',
      'is_viewed': true
    },
    {
      'id': 0,
      'name': 'Ника',
      'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
      'last_message': 'Добрый день, сегодня хотелось бы выпить чашечку кофе',
      'time': '14:00',
      'is_viewed': true
    },
    {
      'id': 1,
      'name': 'Аня',
      'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
      'last_message': 'Увидела твою фотографию и поняла, что любовь с первого взгляда существует',
      'time': '11:00',
      'is_viewed': false
    },
    {
      'id': 2,
      'name': 'Вика',
      'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
      'last_message': 'Привет, тебе больше нравится пасмурная или солнечная погода?',
      'time': '10:50',
      'is_viewed': false
    },
    {
      'id': 3,
      'name': 'Ангелина',
      'image': 'https://i.yapx.cc/SGXLz.jpg',
      'last_message': 'Привет) Познакомимся?',
      'time': '10:00',
      'is_viewed': true
    },
  ];

  List<ChatItemModel> chats = [];

  @override
  void initState() {
    super.initState();
    fetchChats();
  }

  fetchChats() {
    for (var data in response) {
      chats.add(
          ChatItemModel.fromJson(data)
      );
    }
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
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 100, bottom: 100),
                        itemCount: response.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ChatItem(chat: chats[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
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
