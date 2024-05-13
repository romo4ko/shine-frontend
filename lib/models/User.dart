class User {
  final int id;
  final String name;
  final int age;
  final String text;
  final List images;
  final int? distance;
  final List tags;
  final String? sign;

  User(this.id, this.name, this.age, this.text, this.images, this.distance,
      this.tags, this.sign);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        text = json['text'],
        images = json['images'],
        distance = json['distance'],
        tags = json['tags'] ?? [],
        sign = json['sign'];
}
