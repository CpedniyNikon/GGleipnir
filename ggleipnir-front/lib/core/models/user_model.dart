import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String login;
  final String name;
  final String password;
  final String meta;

  const UserModel(this.id, this.login, this.name, this.password, this.meta);

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        login = json['login'],
        name = json['password'],
        password = json['name'],
        meta = json['meta'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'login': login,
        'password': password,
        'name': name,
        'meta': meta
      };

  @override
  String toString() {
    return "$name $login $name $password $meta";
  }

  @override
  List<Object?> get props => [id];
}
