import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';

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
    return Obx(
      ()=> InkWell(
        onTap: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.lobbyRepository.value.lobbies[widget.index].name,
            ),
            Text(
              "${controller.lobbyRepository.value.lobbies[widget.index].playersCount} игроков",
            ),
            Text(
              "${controller.lobbyRepository.value.lobbies[widget.index].id}",
            ),
            Text(
              "${controller.lobbyRepository.value.lobbies[widget.index].ping}",
            ),
            Text(
              "${controller.lobbyRepository.value.lobbies[widget.index].closed}",
            ),
          ],
        ),
      ),
    );
  }
}
