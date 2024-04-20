import 'package:beamer/beamer.dart';
import 'package:dimension/dimension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/appbars/ggappbar.dart';
import 'package:ggleipnir_front/appbars/unauthorized_actions.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/drawers/navigation_side.dart';
import 'package:ggleipnir_front/globals/global_variables.dart';
import 'package:ggleipnir_front/widget/game_list_widget.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';

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
                                gameName: state.pathPatternSegments[1]),
                          ),
                      '*': (context, state, data) => BeamPage(
                            key: ValueKey('games - ${DateTime.now()}'),
                            type: BeamPageType.scaleTransition,
                            child: const GameListWidget(),
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
