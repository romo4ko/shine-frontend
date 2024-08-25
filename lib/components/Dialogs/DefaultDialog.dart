import 'package:flutter/material.dart';
import 'package:shine/components/Common/Inputs/inputs.dart';

class DefaultDialog {
  static DefaultDialog _instance = new DefaultDialog.internal();

  DefaultDialog.internal();

  factory DefaultDialog() => _instance;

  static void showCustomDialog(BuildContext context, {
    required String title,
    String? text,
  }) {
    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          backgroundColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              color: Colors.black,
            ),
            padding: const EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width - 100,
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  text != null ? Text(
                    text,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    textAlign: TextAlign.center,
                  ) : SizedBox(),
                ],
              ),
            ),
          ),
        );
      });
  }

  static void showConfirmDialog(
    BuildContext context, {
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
              child: const Text('Отменить',
                  style: TextStyle(fontSize: 15, color: Colors.white)),
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

  static void showFormDialog(
      BuildContext context, {
        required String title,
        required Function action,
      }) {
    var _controller = TextEditingController();
    var _focusNode = FocusNode();
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.black,
            content: Container(
              width: MediaQuery.of(context).size.width - 100,
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    UnderlineTextField(
                      text: "Текст сообщения",
                      controller: _controller
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Отправить',
                    style: TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  if (!_controller.text.isEmpty) {
                    Navigator.of(context).pop();
                    action(_controller.text);
                  }
                },
              ),
            ],
          );
        });
  }
}
