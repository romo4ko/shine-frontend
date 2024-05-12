
import 'package:flutter/material.dart';

class OptionElevatedButton extends StatelessWidget {

  final String text;
  final Function action;
  final double width;
  final double height;

  final Alignment aligment;

  const OptionElevatedButton({
    super.key,
    required this.text,
    required this.action,
    required this.width,
    required this.height,
    this.aligment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () => {
          action()
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          backgroundColor: Colors.black.withOpacity(0.4),
          foregroundColor: Colors.black.withOpacity(0.5),
          disabledBackgroundColor: Colors.black.withOpacity(1),
        ),
        child: Align(
          alignment: aligment,
          child: Text(
            text,
            textAlign: TextAlign.start,
            style: const TextStyle(
                height: 1,
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}