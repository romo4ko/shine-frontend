
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RangeDistanceSlider extends StatefulWidget {

  const RangeDistanceSlider({super.key});

  @override
  State<RangeDistanceSlider> createState() => _RangeDistanceSliderState();
}

class _RangeDistanceSliderState extends State<RangeDistanceSlider> {

  double _value = 3;

  getDistance(value) {
    switch (value) {
      case 0:
        return 'Близко';
      case 2:
        return 'Район';
      case 3:
        return 'Город';
      case 4:
        return 'Страна';
      case 5:
        return 'Весь мир';
    }
    return 'Близко';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
              'Расстояние:',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 18,
                  fontFamily: 'Inter'
              ),
            ),
              Text(
                getDistance(_value),
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                    fontFamily: 'Inter'
                ),
              ),
            ]
          ),
        ),
        Slider(
          value: _value,
          activeColor: Colors.orangeAccent,
          inactiveColor: Colors.transparent,
          min: 1,
          max: 5,
          divisions: 4,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ],
    );
  }
}