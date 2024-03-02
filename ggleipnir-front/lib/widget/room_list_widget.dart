import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/controllers/http_client_controller.dart';
import 'package:ggleipnir_front/models/game_model.dart';

class RoomListWidget extends ConsumerWidget {
  const RoomListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final httpClient = ref.watch(httpClientProvider);
    final gameRepository = ref.read(gameRepositoryProvider);

    return FutureBuilder<List<GameModel>>(
      future: httpClient.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<GameModel>? data = snapshot.data;
          gameRepository.addList(data!);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemExtent: 20,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(gameRepository.allEntries()[index].name),
                  Image.network(gameRepository.allEntries()[index].imageUrl),
                  Text("${gameRepository.allEntries()[index].peopleInGame}"),
                ],
              );
            },
          );
        }
      },
    );
  }
}
