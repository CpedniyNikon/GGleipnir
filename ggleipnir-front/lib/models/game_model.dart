class GameModel {
  String name;
  String imageUrl;
  int peopleInGame;
  List<String> category;

  GameModel(this.name, this.imageUrl, this.peopleInGame, this.category);

  GameModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = 'https://static-cdn.jtvnw.net/ttv-boxart/29595-285x380.jpg',
        peopleInGame = json['peoplesInGame'],
        category = List<String>.from(json['category']);

  Map<String, dynamic> toJson() =>
      {'name': name, 'imageUrl': imageUrl, 'peopleInGame': peopleInGame, 'categories': category};

  @override
  String toString() {
    return "$name $imageUrl $peopleInGame $category";
  }
}
