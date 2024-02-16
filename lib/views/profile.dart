
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/AppBar/DefaultAppBar.dart';
import 'package:shine/components/Profile/ProfileAppBar.dart';

import '../components/Common/BottomBar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var user = {
    'id': 1,
    'name': 'Александр',
    'age': 25,
    'city': 'Ростов-на-Дону',
    'purpose': 'Свидания',
    'image': "https://avatars.dzeninfra.ru/get-zen_doc/29030/pub_5ae9c5fe3dceb76be76eebac_5ae9cad457906a18134a10ad/scale_1200",
    'is_premium': false,
    'bot_setting': '1'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const ProfileAppBar(title: "С И Я Н И Е", titleSize: 32),
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
                minWidth: MediaQuery.of(context).size.width
            ),
            padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgrounds/profile-bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width:  MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(20, 20, 20, 0.8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(user['image'].toString()),
                                fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              user['name'].toString(),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 18,
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
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const BottomBar(active: "profile"),
          )
        ],
      ),
    );
  }
}
