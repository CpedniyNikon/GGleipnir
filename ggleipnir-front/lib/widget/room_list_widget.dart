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
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                          gameRepository.allEntries()[index].imageUrl),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Text(
                        gameRepository.allEntries()[index].name,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      width: double.infinity,
                      child: Text(
                        "${gameRepository.allEntries()[index].peopleInGame}",
                      ),
                    ),
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
          );
        }
      },
    );
  }
}
