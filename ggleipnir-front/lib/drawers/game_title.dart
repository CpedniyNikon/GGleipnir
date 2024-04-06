import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/constants/test_style.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameTitle extends StatelessWidget {
  final int index;

  const GameTitle({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final gameList = context.read<GameRepositoryController>();

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.gameLobbies,
            parameters: {'gameName': gameList.state.followedGames[index].name});
      },
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: gameList.state.followedGames[index].imageUrl,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  gameList.state.followedGames[index].name,
                  style: TestStyle.commonStyle,
                ),
                Text(
                  "${gameList.state.followedGames[index].category}",
                  style: TestStyle.commonStyle,
                ),
              ],
            ),
            Expanded(
              child: Text(
                "${gameList.state.followedGames[index].peopleInGame}",
                style: TestStyle.commonStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
