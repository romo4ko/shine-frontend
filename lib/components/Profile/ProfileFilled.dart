
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileFilled extends StatelessWidget {

  final int percent;

  const ProfileFilled({
    super.key,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('premium');
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        width:  MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(20, 20, 20, 0.8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, (200-(percent.toDouble())*2)));
                    },
                    blendMode: BlendMode.dstIn,
                    child:  SvgPicture.asset(
                      'assets/icons/star.svg',
                      height: 80,
                      width: 80,
                    ),
                  ),
                  Text(
                    "$percent%",
                    style: const TextStyle(
                      fontFamily: 'kistyac',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                 'Заполни профиль',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Container(
                  width: 200,
                  child: Text(
                    "Получи Premium на 3 дня за полное заполнение профиля. Сияй ярче всех!",
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
              alignment: Alignment.center,
              padding: EdgeInsets.all(10),
              child: SvgPicture.asset(
                'assets/icons/arrow-bottom.svg',
                height: 8,
                width: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}