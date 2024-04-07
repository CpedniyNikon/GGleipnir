import 'package:dimension/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/appbars/authorized_appbar.dart';
import 'package:ggleipnir_front/appbars/unauthorized_appbar.dart';
import 'package:ggleipnir_front/constants/text_style.dart';
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
                width: 20.toVWLength.toPX(screenSize: MediaQuery.of(context).size),
                child: const FollowedGameDrawer(),
              ),
              const VerticalDivider(
                width: 0,
              ),
              DimensionSizedBox(
                width: 80.toVWLength,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Просмотр',
                          style: GGTextStyle.mainHeaderStyle,
                        ),
                        GameListWidget(),
                      ],
                    ),
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
