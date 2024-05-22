import 'dart:async';
import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/models/lobby_model.dart';
import 'package:ggleipnir_front/core/models/user_model.dart';
import 'package:ggleipnir_front/core/repositories/game_repository.dart';
import 'package:ggleipnir_front/core/models/game_model.dart';
import 'package:ggleipnir_front/core/repositories/lobby_repository.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  final String baseUrl = 'http://localhost:8080';

  final gameRepository = Rx<GameRepository>(GameRepository.empty());
  final lobbyRepository = Rx<LobbyRepository>(LobbyRepository.empty());
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
      if(isFetching.value == true && data.isNotEmpty) {
        isFetching.value = false;
      }
    } else {
      throw Exception('Failed to load data');
    }

    gameRepository.refresh();
    debugPrint('game list received');

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
    } else {
      throw Exception('Failed to load data');
    }
    lobbyRepository.refresh();
    debugPrint('lobby list received');
  }

  Future<void> createLobby(String lobbyName, String gameCartId) async {
    lobbyRepository.value.lobbies = [];
    final response =
    await http.post(Uri.parse('$baseUrl/v1/lobby'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': lobbyName,
          'closed': false,
          'gameCartId': gameCartId,
        })
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load data');
    }
    debugPrint('lobby created');
  }

  Future<void> joinLobby(String userId, String lobbyId) async {
    final response =
    await http.post(Uri.parse('$baseUrl/v1/lobby/user?userId=${userId}&lobbyId=${lobbyId}'),
        headers: {
          'Content-Type': 'application/json',
        },
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception('Failed to load data');
    }
    debugPrint('lobby joined');
  }

  Future<void> quitLobbies(String userId) async {
    for(int i = 0; i < lobbyRepository.value.lobbies.length; i++) {
      await http.delete(Uri.parse('$baseUrl/v1/lobby/user?userId=${userId}&lobbyId=${lobbyRepository.value.lobbies[i].id}'),
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
      debugPrint(data.toString());

      user.value = data;
      isAuthorized.value = true;
      debugPrint("user id: ${user.value.id}");

      result = true;
    }
    user.refresh();
    debugPrint('user data received');
    return result;
  }

  Future<void> register(
      String login, String password, String name, String meta) async {
    final response = await http.post(Uri.parse('$baseUrl/v1/register'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'login': login,
          'password': password,
          'name': name,
          'meta': meta,
        }));

    if (response.statusCode == 200) {
      debugPrint('${response.statusCode}');
    } else {
      throw Exception('Failed to load data');
    }
    debugPrint('registration completed');
  }
}
