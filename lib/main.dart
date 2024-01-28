import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shine/views/bot.dart';
import 'package:shine/views/filters.dart';
import 'package:shine/views/information.dart';
import 'package:shine/views/purpose.dart';
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
      initialRoute: 'welcome',
      routes: {
        'welcome': (context) => const Welcome(),
        'login': (context) => const Login(),
        'registration': (context) => const Registration(),
        'purpose': (context) => const Purpose(),
        'information': (context) => const Information(),
        'filters': (context) => const Filters(),
        'bot': (context) => const Bot(),
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