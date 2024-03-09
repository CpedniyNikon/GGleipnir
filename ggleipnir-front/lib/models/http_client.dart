import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:ggleipnir_front/models/lobby_model.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  final String baseUrl = 'http://localhost:8080';

  Future<List<GameModel>> getGameList() async {
    final response = await http.get(
      Uri.parse('$baseUrl/v1/games'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<GameModel> data =
          jsonData.map((json) => GameModel.fromJson(json)).toList();
      debugPrint(data.toString());

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<LobbyModel>> getLobbyList(String gameName) async {
    final response = await http.get(
        Uri.parse('$baseUrl/v1/games/$gameName/lobbies'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<LobbyModel> data =
      jsonData.map((json) => LobbyModel.fromJson(json)).toList();
      debugPrint(data.toString());

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}