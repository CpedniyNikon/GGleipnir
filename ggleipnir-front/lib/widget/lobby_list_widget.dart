import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/widget/lobby_widget.dart';

class LobbyListWidget extends StatefulWidget {
  final String gameName;
  const LobbyListWidget({super.key, required this.gameName});

  @override
  State<LobbyListWidget> createState() => _LobbyListWidgetState();
}

class _LobbyListWidgetState extends State<LobbyListWidget> {
  Controller controller = Get.find();
  
  @override
  void initState() {

    controller.getLobbyList(
      widget.gameName,
    ).then((value) => controller.lobbyRepository.refresh());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> ListView.builder(
        shrinkWrap: true,
        itemCount: controller.lobbyRepository.value.lobbies.length,
        itemBuilder: (BuildContext context, int index) {
          return LobbyWidget(index: index);
        },
      ),
    );
  }
}
