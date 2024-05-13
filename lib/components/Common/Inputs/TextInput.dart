
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextInput extends StatefulWidget {

  final String? value;
  final String title;

  const TextInput({
    super.key,
    this.value = null,
    required this.title,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {

  bool is_active = false;
  String? _selectedValue;

  Key _key = new GlobalKey();
  final FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    _selectedValue = widget.value;
    is_active = _selectedValue == null ? false : true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
        print(1);
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 300,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                key: _key,
                controller: controller,
                focusNode: _focusNode,
                textCapitalization: TextCapitalization.words,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1,
                    fontFamily: 'Inter'
                ),
                cursorColor: Colors.white.withOpacity(0.5),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20, right: 0),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  floatingLabelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Inter'
                  ),
                  labelStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 18,
                      fontFamily: 'Inter'
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  focusColor: Colors.transparent,
                  labelText: widget.title,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
                child: SvgPicture.asset('assets/icons/arrow-right.svg', height: 14)
            ),
          ],
        ),
      ),
    );
  }
}