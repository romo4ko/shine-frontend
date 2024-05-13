
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final double titleSize;
  final bool back;

  const DefaultAppBar({
    super.key,
    required this.title,
    this.titleSize = 20.0,
    this.back = true
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
              color: Colors.black.withOpacity(1),
              blurRadius: 50.0,
              spreadRadius: 50,
                offset: Offset(
                  0,
                  -20,
                ),
            )],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              back ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SvgPicture.asset('assets/icons/arrow-back.svg', width: 12),
                ),
              ) : SizedBox(),
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
              Container(width: back ? 52 : 0)
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}