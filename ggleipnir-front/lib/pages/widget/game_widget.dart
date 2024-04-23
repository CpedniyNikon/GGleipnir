import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/src/routes/routes.dart';

class GameWidget extends StatefulWidget {
  final int index;

  const GameWidget({super.key, required this.index});

  @override
  State<GameWidget> createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          if (!controller.gameRepository.value.followedGames.contains(
              controller.gameRepository.value.gamesOnline[widget.index])) {
            controller.followGame(
                controller.gameRepository.value.gamesOnline[widget.index]);
          }
          controller.beamer.currentState?.routerDelegate.beamToNamed(
              '${Routes.gameLobbies}/${controller.gameRepository.value.gamesOnline[widget.index].name}');
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(controller
                  .gameRepository.value.gamesOnline[widget.index].imageUrl),
            ),
            Text(
              controller.gameRepository.value.gamesOnline[widget.index].name,
              style: GGTypography.commonStyle,
            ),
            Text(
              style: GGTypography.commonStyle,
              "${controller.gameRepository.value.gamesOnline[widget.index].peopleInGame} игроков",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                maxLines: 1,
                style: GGTypography.commonStyle,
                "${controller.gameRepository.value.gamesOnline[widget.index].category}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
