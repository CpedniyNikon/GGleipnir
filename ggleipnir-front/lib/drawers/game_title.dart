import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameTitle extends StatelessWidget {
  final int index;

  const GameTitle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final gameList = context.watch<GameRepositoryController>();

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.gameLobbies,
            parameters: {'gameName': gameList.state.followedGames[index].name});
      },
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(gameList.state.followedGames[index].imageUrl),
            ),
            Column(
              children: [
                Text(
                  gameList.state.followedGames[index].name,
                ),
                Text(
                  "${gameList.state.followedGames[index].category}",
                ),
              ],
            ),
            Text(
              "${gameList.state.followedGames[index].peopleInGame} игроков",
            ),
          ],
        ),
      ),
    );
  }
}
