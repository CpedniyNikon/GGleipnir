import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/widget/game_widget.dart';

class GameListWidget extends StatefulWidget {
  const GameListWidget({super.key, required this.beamer});
  final GlobalKey<BeamerState> beamer;
  @override
  State<GameListWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<GameListWidget> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=>
        controller.gameRepository.value.gamesOnline!=[] ?
          GridView.builder(
        shrinkWrap: true,
        itemCount: controller.gameRepository.value.gamesOnline.length,
        itemBuilder: (BuildContext context, int index) {
          return GameWidget(index: index, beamer: widget.beamer,);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
          childAspectRatio: 200 / 340,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
      ) : const SizedBox(width: 30, height: 30, child: CircularProgressIndicator()),
    );
  }
}
