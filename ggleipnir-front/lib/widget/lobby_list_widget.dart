import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/controllers/lobby_repository_controller.dart';
import 'package:ggleipnir_front/repositories/lobby_repository.dart';
import 'package:ggleipnir_front/widget/lobby_widget.dart';

class LobbyListWidget extends StatelessWidget {
  const LobbyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final lobbyList = context.watch<LobbyRepositoryController>();

    return ListView.builder(
      shrinkWrap: true,
      itemCount: lobbyList.state.lobbies.length,
      itemBuilder: (BuildContext context, int index) {
        return LobbyWidget(index: index);
      },
    );
  }
}
