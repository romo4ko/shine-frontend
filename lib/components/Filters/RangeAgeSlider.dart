
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

class RangeAgeSlider extends StatefulWidget {

  final TextEditingController controller;

  const RangeAgeSlider({
    super.key,
    required this.controller,
  });

  @override
  State<RangeAgeSlider> createState() => _RangeAgeSliderState();
}

class _RangeAgeSliderState extends State<RangeAgeSlider> {

  double _lowerValue = 18;
  double _upperValue = 80;

  @override
  void initState() {
    if (widget.controller.text.isEmpty) {
      widget.controller.text = '${_lowerValue.round()}:${_upperValue.round()}';
    } else {
      _lowerValue = double.parse(widget.controller.text.split(':')[0]);
      _upperValue = double.parse(widget.controller.text.split(':')[1]);
    }
    super.initState();
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
              'Возраст:',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 18,
                  fontFamily: 'Inter'
              ),
            ),
              Text(
                '${_lowerValue.round().toString()}-${_upperValue.round().toString()} лет',
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
          min: 18,
          max: 80,
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
              widget.controller.text = '${lowerValue.round()}:${upperValue.round()}';
            });
          },
        ),
      ],
    );
  }
}