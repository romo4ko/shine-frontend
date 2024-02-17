
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/Self.dart';

class ProfileCard extends StatelessWidget {

  final Self user;

  const ProfileCard({
    super.key,
    required this.user,
  });

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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(user.image),
                      fit: BoxFit.cover
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${user.age}, ${user.city}",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user.purpose,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                width: 140,
                height: 30,
                child: ElevatedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, "edit-profile")
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    backgroundColor: Colors.black.withOpacity(0.4),
                    foregroundColor: Colors.black.withOpacity(0.5),
                    disabledBackgroundColor: Colors.black.withOpacity(1),
                  ),
                  child: const Text(
                    "Изменить",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
                SizedBox(
                  width: 140,
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
                          'Premium',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              height: 1,
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.white
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/star.svg',
                          height: 15,
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}