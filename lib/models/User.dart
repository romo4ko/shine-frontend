class User {
  final int id;
  final String name;
  final int age;
  final String text;
  final List images;
  final int? distance;
  final List tags;
  final String? sign;
  final String city;
  final String purpose;
  final String? fs;
  final String? children;
  final String? smoking;
  final String? alcohol;
  final String? education;
  final int? height;

  User(
      this.id,
      this.name,
      this.age,
      this.text,
      this.images,
      this.distance,
      this.tags,
      this.sign,
      this.city,
      this.purpose,
      this.fs,
      this.children,
      this.smoking,
      this.alcohol,
      this.education,
      this.height
  );

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        text = json['text'],
        images = json['images'],
        distance = json['distance'],
        tags = json['tags'] ?? [],
        sign = json['sign'],
        city = json['city'],
        purpose = json['purpose'],
        fs = json['fs'],
        children = json['children'],
        smoking = json['smoking'],
        alcohol = json['alcohol'],
        education = json['education'],
        height = json['height'];
}