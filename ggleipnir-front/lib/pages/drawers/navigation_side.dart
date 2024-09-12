import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/pages/drawers/game_title.dart';
import 'dart:html' as html;

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
      () => Container(
        color: const Color(0xFFEFEFF1),
        height: MediaQuery.of(context).size.height,
        width: controller.toggle.value ||
                (MediaQuery.of(context).size.width !=
                    html.window.screen?.width?.toDouble())
            ? 50
            : 230,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              controller.toggle.value ||
                      (MediaQuery.of(context).size.width !=
                          html.window.screen?.width?.toDouble())
                  ? (MediaQuery.of(context).size.width !=
                          html.window.screen?.width?.toDouble())
                      ? Container()
                      : InkWell(
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Icon(Icons.arrow_back),
                          ),
                          onTap: () {
                            controller.toggle.value = !controller.toggle.value;
                          },
                        )
                  : ListTile(
                      title: const Text(
                        'Для вас',
                        style: GGTypography.header1,
                      ),
                      trailing: InkWell(
                        child: const Icon(Icons.arrow_back),
                        onTap: () {
                          controller.toggle.value = !controller.toggle.value;
                        },
                      ),
                    ),
              controller.toggle.value ||
                      (MediaQuery.of(context).size.width !=
                          html.window.screen?.width?.toDouble())
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SvgPicture.asset('graphics/heart.svg',
                          fit: BoxFit.fill),
                    )
                  : const ListTile(
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: GameTitle(model: game),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: controller.toggle.value ||
                        (MediaQuery.of(context).size.width !=
                            html.window.screen?.width?.toDouble())
                    ? const Icon(Icons.camera_alt)
                    : const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Рекомендуемые игры',
                            style: GGTypography.header1,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
