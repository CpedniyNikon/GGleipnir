import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/constants/test_style.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/drawers/game_title.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';

class FollowedGameDrawer extends StatelessWidget {
  const FollowedGameDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final gameList = context.watch<GameRepositoryController>();
    return Column(
      children: [
        Text(
          'Для вас',
          style: TestStyle.headerStyle,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: gameList.state.followedGames.length,
            itemBuilder: (BuildContext context, int index) {
              return GameTitle(index: index);
            },
          ),
        ),
      ],
    );
  }
}
