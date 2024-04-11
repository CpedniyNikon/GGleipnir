import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/globals/constants/text_style.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/widget/game_widget.dart';

class GameListWidget extends StatefulWidget {
  const GameListWidget({super.key});

  @override
  State<GameListWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<GameListWidget> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Просмотр',
              style: GGTextStyle.mainHeaderStyle,
            ),
            Obx(
              () => controller.gameRepository.value.gamesOnline != []
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemCount:
                          controller.gameRepository.value.gamesOnline.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GameWidget(index: index);
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            MediaQuery.of(context).size.width ~/ 200,
                        childAspectRatio: 200 / 340,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                      ),
                    )
                  : const SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }
}
