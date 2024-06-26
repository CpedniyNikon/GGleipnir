import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String login;
  final String name;
  final String password;
  final String meta;
  final String image;

  const UserModel(
      this.id, this.login, this.name, this.password, this.meta, this.image);

  const UserModel.empty()
      : id = "",
        login = "",
        name = "",
        password = "",
        meta = "",
        image = "";

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
        name = json['password'],
        password = json['name'],
        meta = json['meta'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'login': login,
        'password': password,
        'name': name,
        'meta': meta,
        'image': image,
      };

  @override
  String toString() {
    return "$name $login $name $password $meta $image";
  }

  @override
  List<Object?> get props => [id];
}
