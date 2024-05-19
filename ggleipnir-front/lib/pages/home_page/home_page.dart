import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/pages/appbars/ggappbar.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/pages/drawers/navigation_side.dart';
import 'package:ggleipnir_front/pages/widget/current_lobby_widget.dart';
import 'package:ggleipnir_front/pages/widget/game_list_widget.dart';
import 'package:ggleipnir_front/pages/widget/lobby_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Controller controller = Get.find();

  @override
  void initState() {
    controller.beamer = GlobalKey();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GGAppBar(),
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NavigationSide(),
            const VerticalDivider(
              width: 0,
            ),
            Expanded(
              child: Beamer(
                key: controller.beamer,
                routerDelegate: BeamerDelegate(
                  transitionDelegate: const NoAnimationTransitionDelegate(),
                  locationBuilder: RoutesLocationBuilder(
                    routes: {
                      '/game_lobbies': (context, state, data) => BeamPage(
                            key: ValueKey('game_lobbies - ${DateTime.now()}'),
                            type: BeamPageType.scaleTransition,
                            child: LobbyListWidget(
                                gameId: state.pathPatternSegments[1]),
                          ),
                      '/lobby/:gameId/:lobbyId': (context, state, data) =>
                          BeamPage(
                            key: ValueKey('game_lobbies - ${DateTime.now()}'),
                            type: BeamPageType.scaleTransition,
                            child: CurrentLobbyWidget(
                              gameId: state.pathParameters['gameId']!,
                              lobbyId: state.pathParameters['lobbyId']!,
                            ),
                          ),
                      '*': (context, state, data) => const BeamPage(
                            key: ValueKey('games'),
                            type: BeamPageType.scaleTransition,
                            child: GameListWidget(),
                          ),
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
