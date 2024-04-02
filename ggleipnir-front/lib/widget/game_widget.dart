import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameWidget extends StatelessWidget {
  final int index;

  const GameWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final gameList = context.watch<GameRepositoryController>();

    return InkWell(
      onTap: () {
        gameList.state.followedGames.add(gameList.state.gamesOnline[index]);
        debugPrint('${gameList.state.followedGames.length}');
        Get.toNamed(Routes.gameLobbies,
            parameters: {'gameName': gameList.state.gamesOnline[index].name});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(gameList.state.gamesOnline[index].imageUrl),
          ),
          Text(
            gameList.state.gamesOnline[index].name,
          ),
          Text(
            "${gameList.state.gamesOnline[index].peopleInGame} игроков",
          ),
          Text(
            "${gameList.state.gamesOnline[index].category}",
          ),
        ],
      ),
    );
  }
}
