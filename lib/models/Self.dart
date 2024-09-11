class Self {
  final int id;
  final String name;
  final int age;
  final String? birthdate;
  final String? sex;
  final String? text;
  final String? city;
  final String? purpose;
  final String? image;
  final List images;
  final bool is_premium;
  final String? bot_settings;
  final int? profile_filled;
  final int? invites;
  final String? fs;
  final String? children;
  final String? smoking;
  final String? alcohol;
  final String? education;
  final String? sign;
  final int? height;
  final bool? active;
  final bool is_email_confirmed;

  Self(
      this.id,
      this.name,
      this.age,
      this.birthdate,
      this.sex,
      this.text,
      this.city,
      this.purpose,
      this.image,
      this.images,
      this.is_premium,
      this.bot_settings,
      this.profile_filled,
      this.invites,
      this.fs,
      this.children,
      this.smoking,
      this.alcohol,
      this.education,
      this.sign,
      this.height,
      this.active,
      this.is_email_confirmed
      );

  Self.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        age = json['age'],
        birthdate = json['birthdate'],
        sex = json['gender'],
        text = json['text'],
        city = json['city'],
        purpose = json['purpose'],
        image = json['image'],
        images = json['images'] ?? [],
        is_premium = json['is_premium'],
        bot_settings = json['bot_settings'],
        profile_filled = json['profile_filled'],
        invites = json['invites'],
        fs = json['fs'],
        children = json['children'],
        smoking = json['smoking'],
        alcohol = json['alcohol'],
        education = json['education'],
        sign = json['sign'],
        height = json['height'],
        active = json['active'],
        is_email_confirmed = json['is_email_confirmed'];
}
