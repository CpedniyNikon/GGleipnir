import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/pages/widget/lobby_widget.dart';

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
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        32,
      ),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: controller.lobbyRepository.value.lobbies.length,
              itemBuilder: (BuildContext context, int index) {
                return LobbyWidget(index: index);
              },
            ),
          ),
        ]),
      ),
    );
  }
}