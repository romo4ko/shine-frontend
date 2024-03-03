
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final double titleSize;

  const ProfileAppBar({
    super.key,
    required this.title,
    this.titleSize = 20.0
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+5),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 50.0,
                spreadRadius: 50,
                offset: Offset(
                  0,
                  -30,
                ),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 60),
              Text(
                title,
                style: TextStyle(
                    height: 1,
                    fontFamily: 'Dejavu',
                    fontSize: titleSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'settings');
                },
                child: Container(
                  width: 50,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    'assets/icons/settings.svg',
                    width: 45,
                    height: 45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}