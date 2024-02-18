
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {

  const ChatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+5),
      decoration: BoxDecoration(
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30.0,
            spreadRadius: 30,
            offset: Offset(
              0,
              -30,
            ),
          ),
        ],
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Ч А Т Ы',
            style: TextStyle(
                height: 1,
                fontFamily: 'Dejavu',
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.white
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}