
class LikesModel {
  final bool is_premium;
  List<Like> data;

  LikesModel(
      this.is_premium,
      this.data,
      );

  LikesModel.fromJson(Map<String, dynamic> json)
      : is_premium = json['is_premium'],
        data = List<Like>.from(
            json['data'].map((like) => Like.fromJson(like)));
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
