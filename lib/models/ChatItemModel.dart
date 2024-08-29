class ChatItemModel {
  final int id;
  final String name;
  final String image;
  final String last_message;
  final String time;
  final bool is_viewed;
  final String status;

  ChatItemModel(
    this.id,
    this.name,
    this.image,
    this.last_message,
    this.time,
    this.is_viewed,
    this.status
  );

  ChatItemModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        last_message = json['last_message'],
        time = json['time'],
        is_viewed = json['is_viewed'],
        status = json['status'];
}
