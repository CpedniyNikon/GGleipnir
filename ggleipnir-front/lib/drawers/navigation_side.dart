import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/drawers/game_title.dart';
import 'package:ggleipnir_front/globals/constants/gg_typography.dart';

class NavigationSide extends StatefulWidget {
  const NavigationSide({super.key});

  @override
  State<NavigationSide> createState() => _FollowedGameDrawerState();
}

class _FollowedGameDrawerState extends State<NavigationSide> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: Text(
                'Для вас',
                style: GGTypography.header1,
              ),
              trailing: Icon(Icons.arrow_back),
            ),
            const ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Отслеживаемые',
                    style: GGTypography.header2,
                  ),
                  Text(
                    'игры',
                    style: GGTypography.header2,
                  ),
                ],
              ),
              trailing: Icon(Icons.add_chart),
            ),
            ...controller.gameRepository.value.followedGames.map(
              (game) {
                return GameTitle(model: game);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Рекомендуемые игры',
                style: GGTypography.header1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
