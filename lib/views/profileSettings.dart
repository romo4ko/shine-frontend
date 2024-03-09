
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Profile/profile.dart';
import 'package:shine/components/ProfileSettings/ImagesGrid.dart';

import '../components/Common/AppBar/DefaultAppBar.dart';
import '../components/Common/BottomBar.dart';
import '../models/Self.dart';
import '../components/ProfileSettings/ProfileSettingsFilled.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {

  Self user = Self.fromJson({
    'id': 1,
    'name': 'Александр',
    'age': 25,
    'city': 'Ростов-на-Дону',
    'purpose': 'Свидания',
    'image': "https://avatars.dzeninfra.ru/get-zen_doc/29030/pub_5ae9c5fe3dceb76be76eebac_5ae9cad457906a18134a10ad/scale_1200",
    'images': [
    ],
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
      appBar: const DefaultAppBar(title: "НАСТРОЙКИ ПРОФИЛЯ", titleSize: 24),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width
          ),
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 100),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgrounds/profile-settings-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              ProfileSettingsFilled(percent: user.profile_filled),
              ImagesGrid(images: user.images)
            ],
          ),
        ),
      ),
    );
  }
}
