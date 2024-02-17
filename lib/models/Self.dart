
class Self {

  final int id;
  final String name;
  final int age;
  final String? text;
  final String city;
  final String purpose;
  final String image;
  final bool is_premium;
  final int bot_setting;
  final int profile_filled;
  final int? invites;

  Self(
    this.id,
    this.name,
    this.age,
    this.text,
    this.city,
    this.purpose,
    this.image,
    this.is_premium,
    this.bot_setting,
    this.profile_filled,
    this.invites
  );

  Self.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    name = json['name'],
    age = json['age'],
    text = json['text'],
    city = json['city'],
    purpose = json['purpose'],
    image = json['image'],
    is_premium = json['is_premium'],
    bot_setting = json['bot_setting'],
    profile_filled = json['profile_filled'],
    invites = json['invites'];
}

