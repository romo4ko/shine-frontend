
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Profile/profile.dart';

import '../components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/BottomBar.dart';
import '../models/Self.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  Self user = Self.fromJson({
    'id': 1,
    'name': 'Александр',
    'age': 25,
    'city': 'Ростов-на-Дону',
    'purpose': 'Свидания',
    'image': "https://avatars.dzeninfra.ru/get-zen_doc/29030/pub_5ae9c5fe3dceb76be76eebac_5ae9cad457906a18134a10ad/scale_1200",
    'is_premium': false,
    'bot_setting': 1,
    'profile_filled': 73,
    'invites': 1
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "НАСТРОЙКИ", titleSize: 24),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width
              ),
              padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 100),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/backgrounds/settings-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  ProfileCard(user: user),
                  SizedBox(height: 10),
                  (user.profile_filled < 100) ?
                  ProfileFilled(percent: user.profile_filled) :
                  Container(),
                  SizedBox(height: 10),
                  PremiumInvites(invites: user.invites ?? 0),
                  SizedBox(height: 10),
                  BotSettings()
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
