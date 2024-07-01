class CityModel {
  final int id;
  final String name;

  CityModel(
      this.id,
      this.name,
      );

  CityModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
