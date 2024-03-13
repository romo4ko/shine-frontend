
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PurposeSelect extends StatefulWidget {

  final List<String> values;
  final String selected;
  final String title;
  final String placeholder;

  const PurposeSelect({
    super.key,
    required this.values,
    this.selected = '',
    required this.title,
    this.placeholder = ''
  });

  @override
  State<PurposeSelect> createState() => _PurposeSelectState();
}

class _PurposeSelectState extends State<PurposeSelect> {

  bool is_active = false;
  String? _selectedValue;

  Key _key = new GlobalKey();
  final FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _selectedValue = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              is_active = !is_active;
              if (is_active) {
                _focusNode.requestFocus();
              }
              else {
                _focusNode.unfocus();
              }
            });
          },
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10
            ),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 12,
                          height: 1,
                          fontFamily: 'Inter'
                      ),
                    ),
                    SizedBox(
                      width: 300,
                      height: 30,
                      child: DropdownButton(
                        hint: Text(
                            widget.placeholder,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 18,
                                fontFamily: 'Inter'
                            )
                        ),
                        value: _selectedValue,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Inter'
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                        dropdownColor: Colors.black.withOpacity(0.8),
                        underline: Container(height: 0),
                        iconSize: 0.0,
                        iconDisabledColor: Colors.transparent,
                        onChanged: (String? value) {
                          setState(() {
                            _selectedValue = value!;
                          });
                        },
                        items: widget.values.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, textAlign: TextAlign.start),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
                SvgPicture.asset('assets/icons/arrow-right.svg', height: 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}