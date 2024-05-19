import 'package:equatable/equatable.dart';


class GameModel extends Equatable{
  final String id;
  final String name;
  final String imageUrl;
  final int peopleInGame;
  final String category;

  const GameModel(this.id, this.name, this.imageUrl, this.peopleInGame, this.category);

  GameModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        imageUrl = json['imageUrl'],
        peopleInGame = json['peoplesInGame'],
        category = json['category'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'imageUrl': imageUrl, 'peopleInGame': peopleInGame, 'categories': category};

  @override
  String toString() {
    return "$name $imageUrl $peopleInGame $category";
  }

  @override
  List<Object?> get props => [name];

}
