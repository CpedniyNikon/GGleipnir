import 'dart:convert';

import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/models/lobby_model.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:ggleipnir_front/repositories/lobby_repository.dart';
import 'package:http/http.dart' as http;

class Controller extends GetxController {
  final String baseUrl = 'http://localhost:8080';

  final gameRepository = Rx<GameRepository>(GameRepository([], []));
  final lobbyRepository = Rx<LobbyRepository>(LobbyRepository([]));
  late GlobalKey<BeamerState> beamer;

  @override
  void onInit() {
    getGameList();
    super.onInit();
  }

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
      debugPrint(data.toString());

      gameRepository.value.gamesOnline = data;
    } else {
      throw Exception('Failed to load data');
    }
    gameRepository.refresh();
    debugPrint('game list received');
  }

  Future<void> getLobbyList(String gameName) async {
    lobbyRepository.value.lobbies = [];
    final response =
        await http.get(Uri.parse('$baseUrl/v1/games/$gameName/lobbies'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<LobbyModel> data =
          jsonData.map((json) => LobbyModel.fromJson(json)).toList();
      debugPrint(data.toString());

      lobbyRepository.value.lobbies = data;
    } else {
      throw Exception('Failed to load data');
    }
    lobbyRepository.refresh();
    debugPrint('lobby list received');
  }
}
