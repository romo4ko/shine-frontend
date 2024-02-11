import 'dart:ffi';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';

class UserCard extends StatefulWidget {

  final user;
  final CardSwiperController swipeController;

  const UserCard({
    super.key,
    required this.user,
    required this.swipeController
  });

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {

  var currentImageIndex = 0;

  changeImage() {
    if (currentImageIndex < widget.user['images'].length-1) {
      setState(() {
        currentImageIndex++;
      });
    }
    else {
      setState(() {
        currentImageIndex = 0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height-200,
      padding: EdgeInsets.only(bottom: 100),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:  MediaQuery.of(context).size.height-200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                      color: Colors.black,
                    ),
                    child: GestureDetector(
                      onTap: () => {
                        changeImage()
                      },
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                        ),
                        child: Image.network(
                          widget.user['images'][currentImageIndex],
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                    )
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 2, right: 1),
                      height: 80,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 30.0,
                            spreadRadius: 30,
                            offset: Offset(
                              0,
                              30,
                            ),
                          ),
                          // BoxShadow(
                          //   offset: Offset(0, 0),
                          // ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              widget.swipeController.swipe(CardSwiperDirection.left);
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width-100)/4,
                              child: SvgPicture.asset(
                                'assets/icons/dislike.svg',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.swipeController.undo();
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width-100)/4,
                              child: SvgPicture.asset(
                                'assets/icons/back-button.svg',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'tape');
                            },
                            child: Container(
                              width: 80,
                              child: SvgPicture.asset(
                                'assets/icons/star.svg',
                                height: 80,
                                width: 80,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'chats');
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width-100)/4,
                              child: SvgPicture.asset(
                                'assets/icons/message.svg',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.swipeController.swipe(CardSwiperDirection.right);
                            },
                            child: Container(
                              width: (MediaQuery.of(context).size.width-100)/4,
                              child: SvgPicture.asset(
                                'assets/icons/like.svg',
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${widget.user['name']}, ${widget.user['age']}",
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                            ),
                          ),
                          Text(
                            widget.user['distance'],
                            style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(widget.user['images'].length, (index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: index == currentImageIndex ? Colors.white : Colors.white.withOpacity(0.5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          height: 5,
                          width: (MediaQuery.of(context).size.width-80)/widget.user['images'].length,
                        );
                      }),
                    ),
                  )
                ],
              ),
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.user['text'],
                      style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
