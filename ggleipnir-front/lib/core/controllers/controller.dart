import 'dart:async';
import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/models/lobby_model.dart';
import 'package:ggleipnir_front/core/models/message_model.dart';
import 'package:ggleipnir_front/core/models/user_model.dart';
import 'package:ggleipnir_front/core/repositories/game_repository.dart';
import 'package:ggleipnir_front/core/models/game_model.dart';
import 'package:ggleipnir_front/core/repositories/lobby_repository.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  final String baseUrl = 'http://localhost:8080';

  final gameRepository = Rx<GameRepository>(GameRepository.empty());
  final lobbyRepository = Rx<LobbyRepository>(LobbyRepository.empty());
  RxList<MessageModel> messages = RxList();
  RxList<UserModel> users = RxList();
  final user = Rx<UserModel>(const UserModel.empty());

  late GlobalKey<BeamerState>? beamer;
  final toggle = Rx<bool>(false);
  final isAuthorized = Rx<bool>(false);
  final isFetching = Rx<bool>(true);

  void followGame(GameModel gameModel) {
    gameRepository.value.addEntry(gameModel, GameType.followed);
    gameRepository.refresh();
  }

  Future<void> getGameList() async {
    gameRepository.value.gamesOnline = [];

    final response = await http.get(Uri.parse('$baseUrl/v1/games'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<GameModel> data =
      jsonData.map((json) => GameModel.fromJson(json)).toList();
      gameRepository.value.gamesOnline = data;
      if (isFetching.value == true && data.isNotEmpty) {
        isFetching.value = false;
      }
    } else {
      throw Exception('Failed to load data');
    }

    gameRepository.refresh();
    // debugPrint('game list received');
  }

  Future<void> getLobbyList(String gameId) async {
    lobbyRepository.value.lobbies = [];
    final response =
    await http.get(Uri.parse('$baseUrl/v1/lobby?gameId=$gameId'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<LobbyModel> data =
      jsonData.map((json) => LobbyModel.fromJson(json)).toList();
      lobbyRepository.value.lobbies = data;

      final List<UserModel> list = [];
      for(int i = 0; i < lobbyRepository.value.lobbies.length; i++) {
        if(lobbyRepository.value.lobbies[i].playersIds.contains(user.value.id)) {
          for(int j = 0; j < lobbyRepository.value.lobbies[i].playersIds.length; j++) {
            final user = await getUser(lobbyRepository.value.lobbies[i].playersIds[j]);
            list.add(user);
          }
        }
      }
      users.value = list;
      users.refresh();
    } else {
      throw Exception('Failed to load data');
    }
    lobbyRepository.refresh();
    debugPrint('lobby list received');
  }

  Future<void> createLobby(String lobbyName, String gameCartId) async {
    lobbyRepository.value.lobbies = [];
    final response = await http.post(Uri.parse('$baseUrl/v1/lobby'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': lobbyName,
          'closed': false,
          'gameCartId': gameCartId,
        }));

    if (response.statusCode == 200) {} else {
      throw Exception('Failed to load data');
    }
    debugPrint('lobby created');
  }

  Future<void> joinLobby(String userId, String lobbyId) async {
    final response = await http.post(
      Uri.parse('$baseUrl/v1/lobby/user?userId=${userId}&lobbyId=${lobbyId}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {} else {
      throw Exception('Failed to load data');
    }
    debugPrint('lobby joined');
  }

  Future<void> quitLobbies(String userId) async {
    for (int i = 0; i < lobbyRepository.value.lobbies.length; i++) {
      await http.delete(
        Uri.parse(
            '$baseUrl/v1/lobby/user?userId=${userId}&lobbyId=${lobbyRepository
                .value.lobbies[i].id}'),
      );
    }
    lobbyRepository.refresh();
  }

  Future<bool> login(String login, String password) async {
    bool result = false;

    final response = await http.post(Uri.parse('$baseUrl/v1/login'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'login': login,
          'password': password,
        }));

    if (response.statusCode == 200) {
      final UserModel data = UserModel.fromJson(json.decode(response.body));

      user.value = data;
      isAuthorized.value = true;
      debugPrint("user id: ${user.value.id}");

      result = true;
    }
    user.refresh();
    debugPrint('user data received');
    return result;
  }

  Future<void> register(String login, String password, String name, String imageData,
      String meta) async {
    final response = await http.post(Uri.parse('$baseUrl/v1/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'login': login,
          'password': password,
          'name': name,
          'meta': meta,
          'image': imageData,
        }));

    if (response.statusCode == 200) {
      debugPrint('${response.statusCode}');
    } else {
      throw Exception('Failed to load data');
    }
    debugPrint('registration completed');
  }

  Future<void> writeMessage(String lobbyId, String userId,
      String message) async {
    final response = await http.post(Uri.parse('$baseUrl/v1/message'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'lobbyId': lobbyId,
          'userId': userId,
          'message': message,
        }));

    if (response.statusCode == 200) {
      debugPrint('${response.statusCode}');
    }
    debugPrint('message send');
  }

  Future<void> getMessages(String lobbyId) async {
    final response =
    await http.get(Uri.parse('$baseUrl/v1/messages?lobbyId=${lobbyId}'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData =
      json.decode(utf8.decode(response.bodyBytes));
      final List<MessageModel> data =
      jsonData.map((json) => MessageModel.fromJson(json)).toList();
      messages.value = data;
    }
    messages.refresh();
  }

  Future<LobbyModel> getLobby(String lobbyId) async {
    debugPrint(lobbyId);
    final response =
        await http.get(Uri.parse('$baseUrl/v1/lobby/lobby?lobbyId=$lobbyId'));
    if (response.statusCode == 200) {
      final LobbyModel lobbyModel = LobbyModel.fromJson(json.decode(response.body));
      return lobbyModel;
    }
    return LobbyModel.empty();
  }

  Future<UserModel> getUser(String userId) async {
    final response =
    await http.get(Uri.parse('$baseUrl/v1/user?userId=${userId}'));

    if (response.statusCode == 200) {
      final UserModel data = UserModel.fromJson(json.decode(response.body));
      return data;
    }
    return const UserModel.empty();
  }
}
