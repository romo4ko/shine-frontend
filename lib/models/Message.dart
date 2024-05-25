class Message {
  final int sender_id;
  final String text;
  final String time;
  final Map<String, dynamic>? content;

  Message(
    this.sender_id,
    this.text,
    this.time,
    this.content,
  );

  Message.fromJson(Map<String, dynamic> json)
      : sender_id = json['sender_id'],
        text = json['text'],
        time = json['time'],
        content = json['content'];
}
