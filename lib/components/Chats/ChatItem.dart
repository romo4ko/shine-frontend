
import 'package:flutter/material.dart';
import 'package:shine/models/ChatItemModel.dart';
import 'package:shine/views/chat.dart';

class ChatItem extends StatefulWidget {

  final ChatItemModel chat;

  const ChatItem({
    super.key,
    required this.chat
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Chat(chat_id: widget.chat.id))
        )
        // Navigator.pushNamed(
        //   context,
        //   Chat.routeName,
        //   arguments: ChatArguments(widget.chat.id),
        // )
      }),
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    widget.chat.image
                ),
                maxRadius: 30,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.chat.name,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          widget.chat.is_viewed ? Container() :
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 7,
                            width: 7,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(30)),
                                color: Colors.white.withOpacity(0.8)
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.chat.time,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                  Text(
                    widget.chat.last_message,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
