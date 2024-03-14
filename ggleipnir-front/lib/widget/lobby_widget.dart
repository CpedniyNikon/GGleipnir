import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/controllers/lobby_repository_controller.dart';

class LobbyWidget extends StatelessWidget {
  final int index;

  const LobbyWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final lobbyList = context.watch<LobbyRepositoryController>();
    return InkWell(
      onTap: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lobbyList.state.lobbies[index].name,
          ),
          Text(
            "${lobbyList.state.lobbies[index].playersCount} игроков",
          ),
          Text(
            "${lobbyList.state.lobbies[index].id}",
          ),
          Text(
            "${lobbyList.state.lobbies[index].ping}",
          ),
          Text(
            "${lobbyList.state.lobbies[index].closed}",
          ),
        ],
      ),
    );
  }
}
