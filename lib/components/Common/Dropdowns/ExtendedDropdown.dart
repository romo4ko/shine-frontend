
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExtendedDropdown extends StatefulWidget {

  final List<String> values;
  final String? selected;
  final String title;
  final String placeholder;

  const ExtendedDropdown({
    super.key,
    required this.values,
    this.selected = null,
    required this.title,
    this.placeholder = ''
  });

  @override
  State<ExtendedDropdown> createState() => _ExtendedDropdownState();
}

class _ExtendedDropdownState extends State<ExtendedDropdown> {

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
    return GestureDetector(
      onTap: () {
        setState(() {
            _focusNode.requestFocus();
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: 60,
              padding: EdgeInsets.only(left: 20, right: 25),
              child: DropdownButtonFormField(
                key: _key,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  labelText: _selectedValue != null ? widget.title : null,
                  floatingLabelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Inter'
                  ),
                ),
                hint: Text(
                    widget.title,
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
            Container(
              margin: EdgeInsets.only(right: 20),
              child: SvgPicture.asset('assets/icons/arrow-right.svg', height: 14)
            ),
          ],
        ),
      ),
    );
  }
}