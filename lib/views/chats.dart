
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Chats/ChatsAppBar.dart';
import 'package:shine/models/Chat.dart';
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
      'image': 'https://uprostim.com/wp-content/uploads/2021/03/image070-58.jpg',
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

  List<Chat> chats = [];

  @override
  void initState() {
    super.initState();
    fetchChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const ChatsAppBar(),
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
                image: AssetImage("assets/images/backgrounds/chats-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.topCenter,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
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
          Container(
            alignment: Alignment.bottomCenter,
            child: const BottomBar(active: "chats"),
          )
        ],
      ),
    );
  }

  fetchChats() {
    for (var data in response) {
      chats.add(
          Chat.fromJson(data)
      );
    }
  }
}
