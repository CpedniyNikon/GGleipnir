import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/constants/text_style.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/drawers/game_title.dart';

class FollowedGameDrawer extends StatefulWidget {
  const FollowedGameDrawer({super.key});

  @override
  State<FollowedGameDrawer> createState() => _FollowedGameDrawerState();
}

class _FollowedGameDrawerState extends State<FollowedGameDrawer> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Column(
        children: [
          const Text(
            'Для вас',
            style: GGTextStyle.headerStyle,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.gameRepository.value.followedGames.length,
              itemBuilder: (BuildContext context, int index) {
                return GameTitle(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
