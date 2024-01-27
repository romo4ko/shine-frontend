
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UnderlinePasswordField extends StatefulWidget {

  final String text;

  const UnderlinePasswordField({super.key, required this.text});

  @override
  _UnderlinePasswordFieldState createState() => _UnderlinePasswordFieldState();
}

class _UnderlinePasswordFieldState extends State<UnderlinePasswordField> {

  var isPasswordHidden = true;

  void changePasswordField() {
    isPasswordHidden = !isPasswordHidden;
    setState(() { });
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordHidden,
      style: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          color: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          icon: isPasswordHidden ?
          Icon(
              Icons.visibility_off,
              size: 30,
              color: Colors.black.withOpacity(0.4)
          ) :
          Icon(
              Icons.visibility,
              size: 30,
              color: Colors.black.withOpacity(0.4)
          ),
          onPressed: () => {
            changePasswordField()
          },
        ),
        contentPadding: const EdgeInsets.only(bottom: 10.0),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(0.6), width: 1.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(1), width: 1.0),
        ),
        labelStyle: const TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Inter'),
        fillColor: Colors.white,
        focusColor: Colors.white,
        labelText: widget.text,
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}