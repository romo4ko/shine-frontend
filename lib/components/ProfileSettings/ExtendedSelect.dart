
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExtendedSelect extends StatefulWidget {

  final List<String> values;
  final String? selected;
  final String title;
  final String placeholder;

  const ExtendedSelect({
    super.key,
    required this.values,
    this.selected = null,
    required this.title,
    this.placeholder = ''
  });

  @override
  State<ExtendedSelect> createState() => _ExtendedSelectState();
}

class _ExtendedSelectState extends State<ExtendedSelect> {

  bool is_active = false;
  String? _selectedValue;

  Key _key = new GlobalKey();
  final FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _selectedValue = widget.selected;
    is_active = _selectedValue == null ? false : true;
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
                vertical: !is_active ? 21 : 10
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
                          fontSize: is_active ? 12 : 20,
                          height: 1,
                          fontFamily: 'Inter'
                      ),
                    ),
                    !is_active ? Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        controller.text,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 16,
                            height: 1,
                            fontFamily: 'Inter'
                        ),
                      ),
                    ) : Container(),
                    is_active ? SizedBox(
                      width: 300,
                      height: 30,
                      child: Focus(
                        onFocusChange: (hasFocus) {
                          if(!hasFocus) {
                            is_active = false;
                          }
                        },
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
                      ),
                    ) : Container()
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