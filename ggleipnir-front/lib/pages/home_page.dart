import 'package:dimension/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/app_bars/authorized_app_bar.dart';
import 'package:ggleipnir_front/app_bars/unauthorized_app_bar.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/drawers/followed_games.dart';
import 'package:ggleipnir_front/globals/global_variables.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/widget/game_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GameRepositoryController(
        GameRepository([], []),
      )..getGameList(),
      child: Scaffold(
        appBar: GlobalVariables.isAuthorized
            ? const AuthorizedAppBar()
            : const UnAuthorizedAppBar() as PreferredSizeWidget,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(microseconds: 300),
                width: 19.toVWLength.toPX(screenSize: MediaQuery.of(context).size),
                child: const FollowedGameDrawer(),
              ),
              DimensionSizedBox(
                width: 81.toVWLength,
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      GameListWidget(),
                    ],
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
