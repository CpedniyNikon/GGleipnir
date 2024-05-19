import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/pages/widget/lobby_widget.dart';

class LobbyListWidget extends StatefulWidget {
  final String gameId;

  const LobbyListWidget({super.key, required this.gameId});

  @override
  State<LobbyListWidget> createState() => _LobbyListWidgetState();
}

class _LobbyListWidgetState extends State<LobbyListWidget> {
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
        32,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _showCreateLobbyDialog(context, widget.gameId);
              },
              child: const Text(
                'Создать лобби',
                style: GGTypography.header2,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controller.lobbyRepository.value.lobbies.length,
                itemBuilder: (BuildContext context, int index) {
                  return LobbyWidget(index: index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateLobbyDialog(BuildContext context, String gameId) {
    final Controller controller = Get.find();
    final nameController = TextEditingController();
    showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black38.withOpacity(0.8),
      context: context,
      builder: (context) => AlertDialog(
        insetPadding: const EdgeInsets.all(20),
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(4))),
        titlePadding: EdgeInsets.zero,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: FractionalOffset.topRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.clear),
              ),
            ),
            Text(
              'Создать лобби',
              style: GGTypography.header1.apply(),
            ),
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: const Text('Название лобби'),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.deepPurple),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.createLobby(nameController.text, widget.gameId);
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: const Center(
                    child: Text('Создать'),
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
