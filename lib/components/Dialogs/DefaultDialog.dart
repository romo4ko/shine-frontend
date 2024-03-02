import 'package:flutter/material.dart';

class DefaultDialog {
  static DefaultDialog _instance = new DefaultDialog.internal();

  DefaultDialog.internal();

  factory DefaultDialog() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel"}) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.black,
            ),
          );
        });
  }
}