class LobbyModel {
  final String id;
  final String name;
  List<String> playersIds = [];
  final int ping;
  final bool closed;
  final String gameCartId;

  LobbyModel(this.id, this.name, this.playersIds, this.ping, this.closed, this.gameCartId);

  LobbyModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        playersIds = List<String>.from(json['playerIds']),
        ping = json['ping'],
        closed = json['closed'],
        gameCartId = json['gameCartId'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'playersIds': playersIds,
        'ping': ping,
        'closed': closed,
        'gameCartId': gameCartId
      };

  @override
  String toString() {
    return "$name $playersIds $id $ping $closed $gameCartId";
  }
}
