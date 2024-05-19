import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/pages/widget/game_widget.dart';

class CurrentLobbyWidget extends StatefulWidget {
  final String lobbyId;
  final String gameId;
  const CurrentLobbyWidget({super.key, required this.gameId, required this.lobbyId});

  @override
  State<CurrentLobbyWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<CurrentLobbyWidget> {
  Controller controller = Get.find();

  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      controller.getLobbyList(
        widget.gameId,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
          32
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Просмотр',
              style: GGTypography.mainHeaderStyle,
            ),
            const SizedBox(height: 30,),
            Obx(
                  () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.lobbyRepository.value.lobbies.firstWhere((element) => element.id == widget.lobbyId).playersIds.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text("${controller.lobbyRepository.value.lobbies.firstWhere((element) => element.id == widget.lobbyId).playersIds[index]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
