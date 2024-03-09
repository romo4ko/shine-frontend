
import 'package:shine/models/Message.dart';

class ChatModel {
  final int chat_id;
  final int user_id;
  final int self_id;
  final String user_name;
  final String image;
  final bool is_online;
  final bool is_viewed_by_user;
  List<Message> messages;

  ChatModel(
    this.chat_id,
    this.user_id,
    this.self_id,
    this.user_name,
    this.image,
    this.is_online,
    this.is_viewed_by_user,
    this.messages,
  );

  ChatModel.fromJson(Map<String, dynamic> json)
      : chat_id = json['chat_id'],
        user_id = json['user_id'],
        self_id = json['self_id'],
        user_name = json['user_name'],
        image = json['image'],
        is_online = json['is_online'],
        is_viewed_by_user = json['is_viewed_by_user'],
        messages = List<Message>.from(
            json['messages'].map((message) => Message.fromJson(message)));
}
