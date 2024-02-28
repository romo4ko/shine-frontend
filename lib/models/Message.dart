
class Message {

  final int sender_id;
  final String text;
  final String time;

  Message(
      this.sender_id,
      this.text,
      this.time,
  );

  Message.fromJson(Map<String, dynamic> json) :
        sender_id = json['sender_id'],
        text = json['text'],
        time = json['time'];
}
