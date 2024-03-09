
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileSettingsFilled extends StatelessWidget {

  final int percent;

  const ProfileSettingsFilled({
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
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromRGBO(20, 20, 20, 0.8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Заполнен на ${percent}%',
                    style: const TextStyle(
                        height: 1,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        color: Colors.white
                    ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  width: 150,
                  height: 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      stops: [
                        percent/100,
                        0.01,
                      ],
                      colors: [
                        Colors.black.withOpacity(0.7),
                        Colors.transparent
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}