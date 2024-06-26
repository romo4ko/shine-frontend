import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Common/AppBar/TransparentAppBar.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/data/api/api_service.dart';
import 'package:shine/models/LikesModel.dart';
import 'package:shine/models/LikesModel.dart';
import '../components/Common/BottomBar.dart';

class Likes extends StatefulWidget {
  const Likes({super.key});

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  var api = ApiService();
  var loading = true;

  var likes;

  fetchLikes() async {
    setState(() {
      loading = true;
    });
    api.likes().then((data) {
      if (data != null) {
        likes = LikesModel.fromJson(data);
      }
      setState(() {
        loading = false;
      });
    });
  }

  dislike(int id) async {
    setState(() {
      loading = true;
    });
    api.revokeLike({'who': id}).then((data) {
      if (data != null) {
        likes = LikesModel.fromJson(data);
      }
      setState(() {
        loading = false;
      });
    });
  }

  like(int id) {
    setState(() {
      loading = true;
    });
    api.confirmLike({'who': id}).then((data) {
      if (data != null) {
        likes = LikesModel.fromJson(data);
      }
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchLikes();
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
                loading
                    ? CustomProgressIndicator()
                    : likes.data.isNotEmpty ? Container(
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
                                padding: const EdgeInsets.only(
                                    top: 100, bottom: 100),
                                crossAxisCount: 2,
                                childAspectRatio: (3 / 4),
                                mainAxisSpacing: 20,
                                crossAxisSpacing: 20,
                                children:
                                    List.generate(likes.data.length, (index) {
                                  return !likes.is_premium
                                      ? ClipRRect(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                ),
                                                child: Image.network(
                                                  likes.data[index].image,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
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
                                                    color: Colors.grey
                                                        .withOpacity(0.1),
                                                    alignment: Alignment.center,
                                                    child: SvgPicture.asset(
                                                        'assets/icons/likes-heart.svg',
                                                        width: 65),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))
                                      : ClipRRect(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                ),
                                                child: Image.network(
                                                  likes.data[index].image,
                                                  height: MediaQuery.of(context)
                                                      .size
                                                      .height,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              ClipRRect(
                                                  child: Container(
                                                padding: EdgeInsets.all(10),
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => {
                                                        dislike(likes.data[index].id),
                                                      },
                                                      child: SvgPicture.asset(
                                                        'assets/icons/dislike.svg',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () => {
                                                        like(likes.data[index].id),
                                                      },
                                                      child: SvgPicture.asset(
                                                        'assets/icons/like.svg',
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                            ],
                                          ));
                                }),
                              ),
                            ),
                          ),
                        ),
                      ) : const Center(
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
