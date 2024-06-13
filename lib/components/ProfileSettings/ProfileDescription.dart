
import 'package:flutter/material.dart';
import 'package:shine/data/api/api_service.dart';

class ProfileDescription extends StatefulWidget {

  final String? text;

  const ProfileDescription({
    super.key,
    this.text
  });

  @override
  State<ProfileDescription> createState() => _ProfileDescriptionState();
}

class _ProfileDescriptionState extends State<ProfileDescription> {

  TextEditingController _text = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  var api = ApiService();

  save() {
    api.updateUserProperties({
      'text': _text.text,
    }).then((data) => {
      print(data['status'])
    });
  }

  @override
  void initState() {
    if (widget.text != null) {
      _text.text = widget.text!;
    }
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        print(1);
        save();
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
              'Описание профиля',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Inter'
              ),
            ),
        ),
        TextFormField(
          focusNode: _focusNode,
          controller: _text,
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          maxLines: 5,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              height: 1.5
          ),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            label: Text(
              'Введите описание профиля',
              textAlign: TextAlign.start,
              style: const TextStyle(height: 1.5),
            ),
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignLabelWithHint: true,
            labelStyle: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
                fontFamily: 'Inter',
                height: 1.5
            ),
            fillColor: const Color.fromRGBO(20, 20, 20, 0.8),
            filled: true,
            focusColor: Colors.white,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ],
    );
  }
}