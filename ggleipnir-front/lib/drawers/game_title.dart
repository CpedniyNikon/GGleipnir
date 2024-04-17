import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameTitle extends StatefulWidget {
  final GameModel model;

  const GameTitle({super.key, required this.model});

  @override
  State<GameTitle> createState() => _GameTitleState();
}

class _GameTitleState extends State<GameTitle> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.beamer.currentState?.routerDelegate
            .beamToNamed('${Routes.gameLobbies}/${widget.model.name}');
      },
      child: Obx(
        () => controller.toggle.value
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: widget.model.imageUrl,
                  width: 30,
                  height: 30,
                  fit: BoxFit.fill,
                ),
              )
            : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: widget.model.imageUrl,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.model.name,
                          style: GGTypography.commonStyle,
                        ),
                        Text(
                          "${widget.model.category}",
                          style: GGTypography.commonStyle,
                        ),
                      ],
                    ),
                    Expanded(
                      child: Text(
                        "${widget.model.peopleInGame}",
                        style: GGTypography.commonStyle,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
            ),
      ),
    );
  }
}
