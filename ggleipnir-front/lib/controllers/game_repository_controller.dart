import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:http/http.dart' as http;

class GameRepositoryController extends Cubit<GameRepository> {
  final String baseUrl = 'http://localhost:8080';
  GameRepositoryController(super.initialState);


  void getGameList() async {
    emit(state.copyWith(games: []));

    final response = await http.get(
      Uri.parse('$baseUrl/v1/games'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<GameModel> data =
          jsonData.map((json) => GameModel.fromJson(json)).toList();
      debugPrint(data.toString());

      emit(state.copyWith(games: data));
    } else {
      throw Exception('Failed to load data');
    }
  }

}
