import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            Image.network(controller
                .gameRepository.value.gamesOnline[widget.index].imageUrl,
            width: 200,),
            Text(
              controller.gameRepository.value.gamesOnline[widget.index].name,
              style: GGTypography.commonStyle,
            ),
            Text(
              style: GGTypography.commonStyle,
              """
${controller.gameRepository.value.gamesOnline[widget.index].peopleInGame} игроков""",
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    controller
                        .gameRepository.value.gamesOnline[widget.index].category
                        .sublist(0, 2)[index],
                    style: GGTypography.commonStyle.apply(),
                  ),
                ), separatorBuilder: (BuildContext context, int index) => SizedBox(width: 5,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
