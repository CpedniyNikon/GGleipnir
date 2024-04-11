import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/globals/constants/text_style.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameTitle extends StatefulWidget {
  final int index;

  const GameTitle({super.key, required this.index});

  @override
  State<GameTitle> createState() => _GameTitleState();
}

class _GameTitleState extends State<GameTitle> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Obx(
        ()=> InkWell(
        onTap: () {
          controller.beamer.currentState?.routerDelegate
              .beamToNamed('${Routes.gameLobbies}/${controller.gameRepository.value.gamesOnline[widget.index].name}');
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: controller.gameRepository.value.followedGames[widget.index].imageUrl,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.gameRepository.value.followedGames[widget.index].name,
                  style: GGTextStyle.commonStyle,
                ),
                Text(
                  "${controller.gameRepository.value.followedGames[widget.index].category}",
                  style: GGTextStyle.commonStyle,
                ),
              ],
            ),
            Expanded(
              child: Text(
                "${controller.gameRepository.value.followedGames[widget.index].peopleInGame}",
                style: GGTextStyle.commonStyle,
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
