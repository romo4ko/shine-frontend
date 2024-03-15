import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shine/views/bot.dart';
import 'package:shine/views/chats.dart';
import 'package:shine/views/filters.dart';
import 'package:shine/views/information.dart';
import 'package:shine/views/likes.dart';
import 'package:shine/views/premium.dart';
import 'package:shine/views/profile.dart';
import 'package:shine/views/profileSettings.dart';
import 'package:shine/views/purpose.dart';
import 'package:shine/views/settings.dart';
import 'package:shine/views/tape.dart';
import 'views/chat.dart';
import 'views/welcome.dart';
import 'views/registration.dart';
import 'views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'chats',
      routes: {
        'welcome': (context) => const Welcome(),
        'login': (context) => const Login(),
        'registration': (context) => const Registration(),
        'purpose': (context) => const Purpose(),
        'information': (context) => const Information(),
        'filters': (context) => const Filters(),
        'bot': (context) => const Bot(),
        'tape': (context) => const Tape(),
        'profile': (context) => const Profile(),
        'chats': (context) => const Chats(),
        'chat': (context) => const Chat(),
        'likes': (context) => const Likes(),
        'settings': (context) => const Settings(),
        'profile-settings': (context) => const ProfileSettings(),
        'premium': (context) => const Premium(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromRGBO(20, 20, 20, 1),
      ),
    );
  }
}

Route _createRoute(widget) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => widget,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}