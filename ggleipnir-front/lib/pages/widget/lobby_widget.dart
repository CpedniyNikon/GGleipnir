import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/src/routes/routes.dart';

class LobbyWidget extends StatefulWidget {
  final int index;

  const LobbyWidget({super.key, required this.index});

  @override
  State<LobbyWidget> createState() => _LobbyWidgetState();
}

class _LobbyWidgetState extends State<LobbyWidget> {
  Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (!controller.isAuthorized.value) return;

        await controller.joinLobby(controller.user.value.id,
            controller.lobbyRepository.value.lobbies[widget.index].id);
        controller.beamer!.currentState?.routerDelegate.beamToNamed(
            '/lobby/${controller.lobbyRepository.value.lobbies[widget.index].gameCartId}/${controller.lobbyRepository.value.lobbies[widget.index].id}');
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Название: ${controller.lobbyRepository.value.lobbies[widget.index].name}",
              ),
              Text(
                ", ${controller.lobbyRepository.value.lobbies[widget.index].playersIds.length} игроков, ",
              ),
              Text(
                " ping: ${controller.lobbyRepository.value.lobbies[widget.index].ping}, ",
              ),
              Text(
                controller.lobbyRepository.value.lobbies[widget.index].closed ==
                        true
                    ? "Закрыто"
                    : "Открыто",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
