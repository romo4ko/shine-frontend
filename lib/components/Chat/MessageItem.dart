
import 'package:flutter/material.dart';
import 'package:shine/models/Message.dart';

class MessageItem extends StatefulWidget {

  final Message message;

  const MessageItem({
    super.key,
    required this.message
  });

  @override
  State<MessageItem> createState() => _MessageItemState();
}

class _MessageItemState extends State<MessageItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(widget.message.text)
    );
  }
}
