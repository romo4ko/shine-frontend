
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

typedef void StringCallback(String val);

class GenderCheckbox extends StatefulWidget {

  final String title;
  final TextEditingController? controller;

  const GenderCheckbox({
    super.key,
    required this.title,
    this.controller
  });

  @override
  State<GenderCheckbox> createState() => _GenderCheckboxState();
}

class _GenderCheckboxState extends State<GenderCheckbox> {

  var selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.title,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter'
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () => {
                  setState(() {
                    selected = 'female';
                    widget.controller?.text = selected;
                  })
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: Colors.black.withOpacity(selected == 'female' ? 0.8 : 0.6),
                  foregroundColor: Colors.black.withOpacity(selected == 'female' ? 0.8 : 0.6),
                  disabledBackgroundColor: Colors.black.withOpacity(1),
                ),
                child: const Align(
                  child: Text(
                    "Женский",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150,
              height: 40,
              child: ElevatedButton(
                onPressed: () => {
                  setState(() => selected = 'male')
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  backgroundColor: Colors.black.withOpacity(selected == 'male' ? 0.8 : 0.6),
                  foregroundColor: Colors.black.withOpacity(selected == 'male' ? 0.8 : 0.6),
                  disabledBackgroundColor: Colors.black.withOpacity(1),
                ),
                child: const Align(
                  child: Text(
                    "Мужской",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        height: 1,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}