import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/core/models/message_model.dart';

class CurrentLobbyWidget extends StatefulWidget {
  final String gameId;
  final String lobbyId;

  const CurrentLobbyWidget(
      {super.key, required this.gameId, required this.lobbyId});

  @override
  State<CurrentLobbyWidget> createState() => _GameListWidgetState();
}

class _GameListWidgetState extends State<CurrentLobbyWidget> {
  Controller controller = Get.find();

  final TextEditingController _controller = TextEditingController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      controller.getLobbyList(
        widget.gameId,
      );

      controller.getMessages(
        widget.lobbyId,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Obx(
        () {
          List<String> users = [];
          if (controller.lobbyRepository.value.lobbies.isNotEmpty) {
            users = controller.lobbyRepository.value.lobbies
                .firstWhere((element) => element.id == widget.lobbyId)
                .playersIds
                .toList();
          }

          List<MessageModel> messages = [];
          if (controller.messages.isNotEmpty) {
            messages = controller.messages
                .where((element) => element.lobbyId == widget.lobbyId)
                .toList();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Просмотр Лобби',
                    style: GGTypography.mainHeaderStyle,
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {
                      controller.quitLobbies(controller.user.value.id);
                      controller.beamer?.currentState?.routerDelegate
                          .beamToNamed('/');
                    },
                    child: Text(
                      'Выйти из лобби',
                      style: GGTypography.header1.apply(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.1),
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListView.builder(
                            controller: ScrollController(),
                            shrinkWrap: true,
                            itemCount: users.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                child: Text(users[index], textAlign: TextAlign.center,),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          controller: ScrollController(),
                          shrinkWrap: true,
                          itemCount: messages.length,
                          reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                              child: Text('${messages[index].message}',
                              textAlign: TextAlign.end,),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              _buildNotificationEmailsInput(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNotificationEmailsInput() {
    return TextFormField(
      controller: _controller,
      validator: (String? value) {
        debugPrint('VALIDATOR: $value');
        if (value!.isEmpty) {
          return 'Emails Required';
        }
        return null;
      },
      onFieldSubmitted: (message) {
        controller.writeMessage(
            widget.lobbyId, controller.user.value.id, message);
        _controller.clear();
        setState(() {});
      },
    );
  }
}
