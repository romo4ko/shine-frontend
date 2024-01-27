
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage("assets/images/appbar-bg.png"),
            //   fit: BoxFit.cover,
            // ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                Colors.black,
                Colors.transparent
              ]),
          ),
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SvgPicture.asset('assets/icons/arrow-back.svg', width: 12),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                    height: 1,
                    fontFamily: 'Dejavu',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
              Container(width: 52,)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}