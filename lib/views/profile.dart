
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shine/components/Common/CustomProgressIndicator.dart';
import 'package:shine/components/Profile/profile.dart';
import 'package:shine/data/api/api_service.dart';

import '../components/Common/BottomBar.dart';
import '../models/Self.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var user;

  var api = ApiService();
  var loading = true;

  fetchChats() {
    setState(() {
      loading = true;
    });
    api.getCurrentUser().then((data) {
      print(data);
      user = Self.fromJson(data);
      setState(() {
        loading = false;
      });
    });
  }

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
      appBar: const ProfileAppBar(title: "С И Я Н И Е", titleSize: 32),
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
                  image: AssetImage("assets/images/backgrounds/profile-bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: loading ? CustomProgressIndicator() : Column(
                children: [
                  ProfileCard(user: user),
                  SizedBox(height: 10),
                  (user.profile_filled < 100) ?
                  ProfileFilled(percent: user.profile_filled) :
                  Container(),
                  SizedBox(height: 10),
                  PremiumInvites(invites: user.invites ?? 0),
                  SizedBox(height: 10),
                  BotSettings(selected: user.bot_settings)
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
