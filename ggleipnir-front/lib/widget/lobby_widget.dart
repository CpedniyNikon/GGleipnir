import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/controllers/lobby_repository_controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class LobbyWidget extends ConsumerWidget {
  final int index;
  const LobbyWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lobbyRepository = ref.watch(lobbyRepositoryProvider);

    return InkWell(
      onTap: () {
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lobbyRepository.allEntries()[index].toString(),
          ),
        ],
      ),
    );
  }
}
