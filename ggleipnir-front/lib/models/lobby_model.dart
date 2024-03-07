class LobbyModel {
  String name;
  int playersCount;
  int id;
  int ping;
  bool closed;

  LobbyModel(this.name, this.playersCount, this.id, this.ping, this.closed);

  LobbyModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        playersCount = json['playersCount'],
        id = json['id'],
        ping = json['ping'],
        closed = json['closed'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'playersCount': playersCount, 'id': id, 'ping': ping,
      'closed': closed};

  @override
  String toString() {
    return "$name $playersCount $id $ping $closed";
  }
}
