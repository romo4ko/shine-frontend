
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TapeAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final double titleSize;

  const TapeAppBar({
    super.key,
    required this.title,
    this.titleSize = 20.0
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 45),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 50.0,
                spreadRadius: 50,
                offset: Offset(
                  0,
                  -20,
                ),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 52),
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
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'filters');
                },
                icon: const Icon(
                    Icons.filter_list,
                    size: 32,
                    color: Colors.white,
                )
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}