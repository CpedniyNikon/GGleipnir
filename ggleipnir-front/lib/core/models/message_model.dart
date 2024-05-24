
class MessageModel {
  final String id;
  final String lobbyId;
  final String userId;
  final String message;
  final int createdAt;

  MessageModel(
      this.id, this.lobbyId, this.userId, this.message, this.createdAt);


  MessageModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        lobbyId = json['lobbyId'],
        userId = json['userId'],
        message = json['message'],
        createdAt = json['createdAt'] as int;

  Map<String, dynamic> toJson() => {
        'id': id,
        'lobbyId': lobbyId,
        'userId': userId,
        'message': message,
        'createdAt': createdAt,
      };

  @override
  String toString() {
    return "$id $lobbyId $userId $message $createdAt";
  }
}
