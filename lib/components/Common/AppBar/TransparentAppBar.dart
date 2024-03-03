
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransparentAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const TransparentAppBar({
    super.key,
    required this.title
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
            offset: const Offset(
              0,
              -30,
            ),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.title,
            style: const TextStyle(
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