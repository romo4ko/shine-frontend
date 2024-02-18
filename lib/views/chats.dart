
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Chats/ChatsAppBar.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/models/Chat.dart';

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
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: NetworkImage(
                                chats[index].image
                            ),
                            maxRadius: 30,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        chats[index].name,
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      !chats[index].is_viewed ? Container() :
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        height: 7,
                                        width: 7,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(30)),
                                            color: Colors.white.withOpacity(0.8)
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    chats[index].time,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: Text(
                                  chats[index].last_message,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
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
