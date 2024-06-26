
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shine/components/Dialogs/DefaultDialog.dart';
import '../components/Common/AppBar/DefaultAppBar.dart';
import '../models/Self.dart';
import 'package:shine/data/api/api_service.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  var api = ApiService();

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    api.logout();
    Navigator.pushNamed(context, 'welcome');
  }

  delete() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    api.deleteUser();
    Navigator.pushNamed(context, 'welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppBar(title: "НАСТРОЙКИ", titleSize: 24),
      body: Container(
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20, bottom: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgrounds/settings-bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20, 20, 20, 0.8),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                children: [
                  // SettingsButton(title: 'Уведомления', route: '/'),
                  // Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  // SettingsButton(title: 'Черный список', route: '/'),
                  // Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  SettingsButton(title: 'FAQ', route: 'faq'),
                  Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  SettingsButton(title: 'Сообщить о проблеме', route: '/'),
                  Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  SettingsButton(title: 'Помощь разработчикам', route: '/'),
                  Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  SettingsButton(title: 'Политика конфиденциальности', route: '/'),
                  Divider(height: 1, color: Colors.white.withOpacity(0.6)),
                  SettingsButton(title: 'Пользовательское соглашение', route: '/'),
                ],
              )
            ),
            Column(
              children: [
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => {
                      logout(),
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.4),
                      foregroundColor: Colors.black.withOpacity(0.5),
                      disabledBackgroundColor: Colors.black.withOpacity(1),
                    ),
                    child: Text(
                      'Выйти',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          height: 1,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () => {
                      DefaultDialog.showConfirmDialog(
                          context,
                          title: 'Вы уверены, что хотите удалить свой аккаунт? Отменить это действие будет невозможно',
                          action: () => {delete()})
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      backgroundColor: Colors.black.withOpacity(0.4),
                      foregroundColor: Colors.black.withOpacity(0.5),
                      disabledBackgroundColor: Colors.black.withOpacity(1),
                    ),
                    child: Text(
                      'Удалить аккаунт',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          height: 1,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          color: Colors.redAccent
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}

class SettingsButton extends StatelessWidget {

  final String title;
  final String route;

  const SettingsButton({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(context, this.route)
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: 20,
        ),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.title,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1,
                  fontFamily: 'Inter'
              ),
            ),
            SvgPicture.asset('assets/icons/arrow-right.svg', height: 14),
          ],
        ),
      ),
    );
  }
}