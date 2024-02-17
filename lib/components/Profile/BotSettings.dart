
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BotSettings extends StatelessWidget {

  final int invites;

  const BotSettings({
    super.key,
    this.invites = 0,
  });

  final Color currentColor = Colors.white;
  final Color activeColor = const Color.fromRGBO(249, 178, 8, 1.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width:  MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(20, 20, 20, 0.8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Получи Premium',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Text(
                      "Мы предоставляем неделю новых функций в обмен на ваши инвайты",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 80,
                width: 80,
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/invites/invite-star-1.svg',
                      height: 80,
                      width: 80,
                      color: (invites < 1) ? currentColor : activeColor,
                    ),
                    SvgPicture.asset(
                      'assets/icons/invites/invite-star-2.svg',
                      height: 80,
                      width: 80,
                      color: (invites < 2) ? currentColor : activeColor,
                    ),
                    SvgPicture.asset(
                      'assets/icons/invites/invite-star-3.svg',
                      height: 80,
                      width: 80,
                      color: (invites < 3) ? currentColor : activeColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              width: 250,
              height: 30,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pushNamed(context, 'premium')
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: Colors.black.withOpacity(0.4),
                  foregroundColor: Colors.black.withOpacity(0.5),
                  disabledBackgroundColor: Colors.black.withOpacity(1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Отправить ссылку',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.white
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/invites/send-link.svg',
                      height: 15,
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}