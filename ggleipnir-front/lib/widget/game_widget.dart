import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ggleipnir_front/controllers/game_name_provider.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/routes/routes.dart';

class GameWidget extends ConsumerWidget {
  final int index;

  const GameWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameRepository = ref.watch(gameRepositoryProvider);

    return InkWell(
      onTap: () {
        ref.read(gameNameProvider.notifier).state =
            gameRepository.allEntries()[index].name;
        Get.toNamed(Routes.gameLobbies);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(gameRepository.allEntries()[index].imageUrl),
          ),
          Text(
            gameRepository.allEntries()[index].name,
          ),
          Text(
            "${gameRepository.allEntries()[index].peopleInGame} игроков",
          ),
          Text(
            "${gameRepository.allEntries()[index].category}",
          ),
        ],
      ),
    );
  }
}
