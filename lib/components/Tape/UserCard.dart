
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shine/components/Tape/CardNavigation.dart';

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

  ScrollController scrollController = ScrollController();

  void _scrollToend() {
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  var currentImageIndex = 0;
  var images = [];

  changeImage() {
    if (currentImageIndex < images.length-1) {
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

  loadImages() {
    for (var image in widget.user['images']) {
      images.add(
          NetworkImage(image)
      );
    }
  }

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (var image in images) {
      precacheImage(image, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
            Radius.circular(20),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height-200,
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(20),
                  ),
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height:  MediaQuery.of(context).size.height-200,

                          child: GestureDetector(
                            onTap: () => {
                              changeImage()
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)
                              ),
                              child: Image(
                                  image: images[currentImageIndex],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                              ),
                            ),
                          )
                        ),
                        Positioned(
                          bottom: 0,
                          child: CardNavigation(swipeController: widget.swipeController)
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
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 5,
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                        ),
                                      ],
                                  ),
                                ),
                                Text(
                                  widget.user['distance'],
                                  style: const TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2, 2),
                                          blurRadius: 5,
                                          color: Color.fromRGBO(0, 0, 0, 0.25),
                                        ),
                                      ],
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
                                  color: index == currentImageIndex ? Colors.white.withOpacity(0.7) : Colors.white.withOpacity(0.3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1)
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
                      padding: const EdgeInsets.only(bottom: 20),
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              widget.user['text'],
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Wrap(
                              children: List.generate(widget.user['tags'].length, (index) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10, bottom: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1)
                                      ),
                                    ],
                                    color: const Color.fromRGBO(20, 20, 20, 1),
                                  ),
                                  child: Text(
                                      widget.user['tags'][index],
                                      style: const TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white
                                      ),
                                  ),
                                );
                              }),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
