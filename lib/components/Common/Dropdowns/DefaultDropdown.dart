
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultDropdown extends StatefulWidget {

  final Map<String, String> items;
  final String title;
  final String placeholder;
  final TextEditingController? controller;

  const DefaultDropdown({
    super.key,
    required this.items,
    required this.title,
    this.placeholder = "Выбрать вариант",
    this.controller
  });

  @override
  State<DefaultDropdown> createState() => _DefaultDropdownState();
}

class _DefaultDropdownState extends State<DefaultDropdown> {

  String? _selectedValue;

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
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(20, 20, 20, 0.8)
          ),
          child: Container(
            padding: EdgeInsets.only(right: 10),
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
                  if (widget.controller != null) {
                    widget.controller?.text = widget.items.keys.firstWhere(
                            (i) => widget.items[i] == _selectedValue
                    );
                  }
                });
              },
              items: widget.items.map((code, value) {
                return MapEntry(
                    {code: value},
                    DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, textAlign: TextAlign.start),
                    )
                  );
              }).values.toList(),
            ),
          ),
        ),
      ],
    );
  }
}