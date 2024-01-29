
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeDistanceSlider extends StatefulWidget {

  const RangeDistanceSlider({super.key});

  @override
  State<RangeDistanceSlider> createState() => _RangeDistanceSliderState();
}

class _RangeDistanceSliderState extends State<RangeDistanceSlider> {

  double _lowerValue = 1000;
  double _upperValue = 100000;

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
              '${_lowerValue.round().toString()}-${_upperValue.round().toString()} км',
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
        FlutterSlider(
          values: [_lowerValue, _upperValue],
          rangeSlider: true,
          min: 1000,
          max: 100000,
          step: FlutterSliderStep(step: 100),
          minimumDistance: 1,
          disabled: false,
          tooltip: FlutterSliderTooltip(
              disabled: true
          ),
          trackBar: FlutterSliderTrackBar(
            activeTrackBarHeight: 4,
            activeTrackBar: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 4.0,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                ),
              ],
            ),
            inactiveTrackBar: BoxDecoration(
              color: Colors.black.withOpacity(0.25),
            ),
          ),
          handlerWidth: 20,
          handlerHeight: 20,
          handler: FlutterSliderHandler(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            setState(() {
              _lowerValue = lowerValue;
              _upperValue = upperValue;
            });
          },
        ),
      ],
    );
  }
}