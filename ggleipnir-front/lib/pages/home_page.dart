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
        drawer: const FollowedGameDrawer(),
        body: const SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GameListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
