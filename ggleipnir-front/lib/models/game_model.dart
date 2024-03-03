class GameModel {
  String name;
  String imageUrl;
  int peopleInGame;

  GameModel(this.name, this.imageUrl, this.peopleInGame);

  GameModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = 'https://static-cdn.jtvnw.net/ttv-boxart/29595-285x380.jpg',
        peopleInGame = json['peoplesInGame'];


  Map<String, dynamic> toJson() =>
      {'name': name, 'imageUrl': imageUrl, 'peopleInGame': peopleInGame};

  @override
  String toString() {
    return "$name $imageUrl $peopleInGame";
  }
}

