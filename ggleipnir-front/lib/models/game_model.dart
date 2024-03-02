class GameModel {
  String name;
  String imageUrl;
  int peopleInGame;

  GameModel(this.name, this.imageUrl, this.peopleInGame);

  GameModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        imageUrl = 'https://i.pinimg.com/originals/2d/cd/80/2dcd80c6f5a21a437313adde93b373d8.png',
        peopleInGame = json['peoplesInGame'];


  Map<String, dynamic> toJson() =>
      {'name': name, 'imageUrl': imageUrl, 'peopleInGame': peopleInGame};

  @override
  String toString() {
    return "$name $imageUrl $peopleInGame";
  }
}

