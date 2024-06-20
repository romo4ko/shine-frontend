import 'package:flutter/material.dart';

class DefaultDialog {
  static DefaultDialog _instance = new DefaultDialog.internal();

  DefaultDialog.internal();

  factory DefaultDialog() => _instance;

  static void showCustomDialog(BuildContext context, {required String title}) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)
                ),
                color: Colors.black87,
              ),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 100,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }

  static void showConfirmDialog(BuildContext context,
      {
        required String title,
        required Function action,
      }) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: Text(
                title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text(
                    'Отменить',
                    style: TextStyle(fontSize: 15, color: Colors.white)
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text(
                    'Удалить',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  action();
                },
              ),
            ],
          );
        });
  }
}
