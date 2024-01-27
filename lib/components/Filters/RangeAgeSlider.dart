
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RangeAgeSlider extends StatefulWidget {

  const RangeAgeSlider({super.key});

  @override
  State<RangeAgeSlider> createState() => _RangeAgeSliderState();
}

class _RangeAgeSliderState extends State<RangeAgeSlider> {

  RangeValues _currentRangeValues = const RangeValues(18, 80);

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
              'Возраст:',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 18,
                  fontFamily: 'Inter'
              ),
            ),
              Text(
                '${_currentRangeValues.start.round().toString()}-${_currentRangeValues.end.round().toString()} лет',
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
        RangeSlider(
          values: _currentRangeValues,
          activeColor: Colors.orangeAccent,
          inactiveColor: Colors.transparent,
          max: 80,
          min: 18,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;
            });
          },
        ),
      ],
    );
  }
}