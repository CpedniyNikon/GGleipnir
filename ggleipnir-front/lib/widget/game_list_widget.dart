import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/widget/game_widget.dart';

class GameListWidget extends StatelessWidget {
  const GameListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameRepositoryController, GameRepository>(
      builder: (context, state) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: state.gamesOnline.length,
          itemBuilder: (BuildContext context, int index) {
            return GameWidget(index: index);
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery
                .of(context)
                .size
                .width ~/ 200,
            childAspectRatio: 200 / 300,
          ),
        );
      },
    );
  }
}
