import 'package:flutter/material.dart';

class DefaultDialog {
  static DefaultDialog _instance = new DefaultDialog.internal();

  DefaultDialog.internal();

  factory DefaultDialog() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel"}
      ) {
      showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black,
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width-100,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
      }
  }