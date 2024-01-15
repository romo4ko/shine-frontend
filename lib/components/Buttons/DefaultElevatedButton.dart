
import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {

  final String text;
  final String action;
  final double width;
  final double height;

  const DefaultElevatedButton({
    super.key,
    required this.text,
    required this.action,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => {
          Navigator.pushNamed(context, action)
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Colors.black.withOpacity(0.4),
          foregroundColor: Colors.black.withOpacity(0.5),
          disabledBackgroundColor: Colors.black.withOpacity(1),
        ),
        child: Text(
          text,
          style: const TextStyle(
              height: 1,
              fontFamily: 'Montserrat',
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Colors.white
          ),

        ),
      ),
    );
  }
}