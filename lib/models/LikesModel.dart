
class LikesModel {
  final bool is_premium;
  List<Like> likes;

  LikesModel(
      this.is_premium,
      this.likes,
      );

  LikesModel.fromJson(Map<String, dynamic> json)
      : is_premium = json['is_premium'],
        likes = List<Like>.from(
            json['likes'].map((like) => Like.fromJson(like)));
}

class Like {
  final int id;
  final String name;
  final String image;

  Like(
      this.id,
      this.name,
      this.image,
      );

  Like.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'];
}
