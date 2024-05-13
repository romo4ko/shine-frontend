
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExtendedInput extends StatefulWidget {

  final String? value;
  final String title;
  final String placeholder;

  const ExtendedInput({
    super.key,
    this.value,
    required this.title,
    this.placeholder = ''
  });

  @override
  State<ExtendedInput> createState() => _ExtendedInputState();
}

class _ExtendedInputState extends State<ExtendedInput> {

  bool is_active = false;

  Key _key = new GlobalKey();
  final FocusNode _focusNode = FocusNode();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.value ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        height: 60,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: !is_active && controller.text.length == 0 ? 20 : 10
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
                      color: is_active ? Colors.white.withOpacity(0.6) : Colors.white,
                      fontSize: is_active ? 10 : 20,
                      height: 1,
                      fontFamily: 'Inter'
                  ),
                ),
                !is_active && controller.text.length > 0 ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    controller.text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 15,
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
                    child: TextFormField(
                      key: _key,
                      controller: controller,
                      focusNode: _focusNode,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
                      cursorColor: Colors.white.withOpacity(0.5),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        labelStyle: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 18, fontFamily: 'Inter'),
                        fillColor: Colors.transparent,
                        filled: true,
                        focusColor: Colors.transparent,
                        labelText: widget.placeholder,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                  ),
                ) : Container()
              ],
            ),
            SvgPicture.asset('assets/icons/arrow-right.svg', height: 14),
          ],
        ),
      ),
    );
  }
}