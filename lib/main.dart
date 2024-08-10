import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shine/views/bot.dart';
import 'package:shine/views/chats.dart';
import 'package:shine/views/faq.dart';
import 'package:shine/views/filters.dart';
import 'package:shine/views/information.dart';
import 'package:shine/views/likes.dart';
import 'package:shine/views/premium.dart';
import 'package:shine/views/profile.dart';
import 'package:shine/views/profileSettings.dart';
import 'package:shine/views/purpose.dart';
import 'package:shine/views/settings.dart';
import 'package:shine/views/support.dart';
import 'package:shine/views/tape.dart';
import 'data/api/api_service.dart';
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
      debugShowCheckedModeBanner: false,
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
        'faq': (context) => const Faq(),
        'support': (context) => const Support(),
      },
      home: CheckAuth(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color.fromRGBO(20, 20, 20, 1),
      ),
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {

  var api = ApiService();
  bool isAuth = false;
  String? filled;

  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      api.checkAuth().then((data) => {
        if (data['user'] != null) {
          setState(() {
            isAuth = true;
            filled = data['filled'];
          })
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      if (filled == 'info') {
        child = Information();
      }
      else if (filled == 'purpose') {
        child = Purpose();
      }
      else {
        child = Profile();
      }
    } else {
      child = Welcome();
    }
    return child;
  }
}


// Route _createRoute(widget) {
//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => widget,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       return child;
//     },
//   );
// }