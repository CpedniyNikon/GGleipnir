import 'package:beamer/beamer.dart';
import 'package:dimension/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/appbars/authorized_appbar.dart';
import 'package:ggleipnir_front/appbars/unauthorized_appbar.dart';
import 'package:ggleipnir_front/constants/text_style.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/drawers/followed_games.dart';
import 'package:ggleipnir_front/globals/global_variables.dart';
import 'package:ggleipnir_front/widget/game_list_widget.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.find();
  final beamer = GlobalKey<BeamerState>();
  @override
  void initState() {
    controller.getGameList().then((value) {
      controller.gameRepository.refresh();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width:
                  20.toVWLength.toPX(screenSize: MediaQuery.of(context).size),
              child: FollowedGameDrawer(beamer: beamer,),
            ),
            const VerticalDivider(
              width: 0,
            ),
            DimensionSizedBox(
              width: 80.toVWLength,
              child: Beamer(
                key: beamer,
                routerDelegate: BeamerDelegate(
                  // NOTE First Method
                  locationBuilder: RoutesLocationBuilder(
                    routes: {
                      '*': (context, state, data) => BeamPage(
                            key: ValueKey('HomePage - ${DateTime.now()}'),
                            type: BeamPageType.scaleTransition,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Просмотр',
                                      style: GGTextStyle.mainHeaderStyle,
                                    ),
                                    GameListWidget(beamer: beamer,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                      '/game_lobbies/:gameName': (context, state, data) => BeamPage(
                          key: ValueKey('game_lobbies - ${DateTime.now()}'),
                          type: BeamPageType.scaleTransition,
                          child: LobbyListWidget(gameName: state.pathPatternSegments[1]),
                        )
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
