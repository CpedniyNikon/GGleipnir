import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/controllers/http_client_controller.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:ggleipnir_front/widget/game_widget.dart';

class RoomListWidget extends ConsumerWidget {
  const RoomListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final httpClient = ref.watch(httpClientProvider);
    final gameRepository = ref.read(gameRepositoryProvider.notifier);

    return FutureBuilder<List<GameModel>>(
      future: httpClient.fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<GameModel>? data = snapshot.data;
          gameRepository.state.addList(data!);
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return GameWidget(index: index);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
              childAspectRatio: 200 / 300,
            ),
          );
        }
      },
    );
  }
}
