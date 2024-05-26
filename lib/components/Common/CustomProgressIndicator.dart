

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProgressIndicator extends StatelessWidget {

  const CustomProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset('assets/icons/star.svg', width: 25),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              strokeWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}
