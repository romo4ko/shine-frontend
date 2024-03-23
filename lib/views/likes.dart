
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Common/AppBar/TransparentAppBar.dart';
import 'package:shine/models/LikesModel.dart';
import 'package:shine/models/LikesModel.dart';
import '../components/Common/BottomBar.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {

  var response = {
      'is_premium': false,
      'likes': [
        {
          'id': 0,
          'name': 'Ника',
          'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
        },
        {
          'id': 1,
          'name': 'Аня',
          'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
        },
        {
          'id': 2,
          'name': 'Вика',
          'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
        },
        {
          'id': 3,
          'name': 'Ангелина',
          'image': 'https://i.yapx.cc/SGXLz.jpg',
        },
        {
          'id': 0,
          'name': 'Ника',
          'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
        },
        {
          'id': 1,
          'name': 'Аня',
          'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
        },
        {
          'id': 2,
          'name': 'Вика',
          'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
        },
        {
          'id': 3,
          'name': 'Ангелина',
          'image': 'https://i.yapx.cc/SGXLz.jpg',
        },
        {
          'id': 0,
          'name': 'Ника',
          'image': 'https://pikuco.ru/upload/test_stable/eee/eee3b0abbfdbcc0e320860a75e236c48.webp',
        },
        {
          'id': 1,
          'name': 'Аня',
          'image': 'https://yobte.ru/uploads/posts/2020-08/obajatelnye-devushki-50-foto-10.jpg',
        },
        {
          'id': 2,
          'name': 'Вика',
          'image': 'https://wp-s.ru/wallpapers/3/16/389721010561919/krasivaya-devushka-na-fone-industrialnogo-pejzazha.jpg',
        },
        {
          'id': 3,
          'name': 'Ангелина',
          'image': 'https://i.yapx.cc/SGXLz.jpg',
        }
      ]
    };

  var likes;

  @override
  void initState() {
    super.initState();
    likes = LikesModel.fromJson(response);
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
            appBar: const TransparentAppBar(title: 'Л А Й К И'),
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
                      child: Container(
                        child: GridView.count(
                          padding: const EdgeInsets.only(top: 100, bottom: 100),
                          crossAxisCount: 2,
                          childAspectRatio: (3 / 4),
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          children: List.generate(likes.likes.length, (index) {
                              return !likes.is_premium ?
                                ClipRRect(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                20.0),
                                            color: Colors.grey.withOpacity(0.1),
                                          ),
                                          child: Image.network(
                                            likes.likes[index].image,
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        ClipRRect(
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              color: Colors.grey.withOpacity(0.1),
                                              alignment: Alignment.center,
                                              child: SvgPicture.asset(
                                                  'assets/icons/likes-heart.svg',
                                                  width: 65),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                ) :
                              ClipRRect(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              20.0),
                                          color: Colors.grey.withOpacity(0.1),
                                        ),
                                        child: Image.network(
                                          likes.likes[index].image,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      ClipRRect(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          alignment: Alignment.bottomCenter,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset(
                                                'assets/icons/dislike.svg',
                                                height: 40,
                                                width: 40,
                                              ),
                                              SvgPicture.asset(
                                                'assets/icons/like.svg',
                                                height: 40,
                                                width: 40,
                                              ),
                                            ],
                                          ),
                                        )
                                      ),
                                    ],
                                  )
                              );
                          }),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const BottomBar(active: "likes"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
