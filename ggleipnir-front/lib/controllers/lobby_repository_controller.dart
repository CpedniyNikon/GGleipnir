import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/models/lobby_model.dart';
import 'package:ggleipnir_front/repositories/lobby_repository.dart';

class LobbyRepositoryController extends Cubit<LobbyRepository> {
  final String baseUrl = 'http://localhost:8080';
  LobbyRepositoryController(super.initialState);


  void getLobbyList(String gameName) async {
    emit(state.copyWith(games: []));

    final response = await http.get(
        Uri.parse('$baseUrl/v1/games/$gameName/lobbies'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      final List<LobbyModel> data =
      jsonData.map((json) => LobbyModel.fromJson(json)).toList();
      debugPrint(data.toString());

      emit(state.copyWith(games: data));
    } else {
      throw Exception('Failed to load data');
    }
  }

}
