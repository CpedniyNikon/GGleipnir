import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/constants/text_style.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/pages/home_page/home_page.dart';
import 'package:ggleipnir_front/routes/routes.dart';

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
            Image.network(controller
                .gameRepository.value.gamesOnline[widget.index].imageUrl),
            Text(
              controller.gameRepository.value.gamesOnline[widget.index].name,
              style: GGTextStyle.commonStyle,
            ),
            Text(
              style: GGTextStyle.commonStyle,
              "${controller.gameRepository.value.gamesOnline[widget.index].peopleInGame} игроков",
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                maxLines: 1,
                style: GGTextStyle.commonStyle,
                "${controller.gameRepository.value.gamesOnline[widget.index].category}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
