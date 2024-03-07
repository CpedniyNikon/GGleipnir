import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/controllers/game_name_provider.dart';
import 'package:ggleipnir_front/controllers/http_client_controller.dart';
import 'package:ggleipnir_front/controllers/lobby_repository_controller.dart';
import 'package:ggleipnir_front/models/lobby_model.dart';
import 'package:ggleipnir_front/widget/lobby_widget.dart';

class LobbyListWidget extends ConsumerWidget {
  const LobbyListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameName = ref.watch(gameNameProvider);
    final lobbyList = ref.watch(lobbyListProvider);
    final gameRepository = ref.read(lobbyRepositoryProvider.notifier);

    return FutureBuilder<List<LobbyModel>>(
      future: lobbyList.getLobbyList(gameName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<LobbyModel>? data = snapshot.data;
          gameRepository.state.addList(data!);
          return GridView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return LobbyWidget(index: index);
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
