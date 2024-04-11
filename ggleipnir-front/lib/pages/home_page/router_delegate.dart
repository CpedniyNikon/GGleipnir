import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ggleipnir_front/constants/text_style.dart';
import 'package:ggleipnir_front/widget/game_list_widget.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';

class GameListLocation extends BeamLocation<BeamState> {
  GameListLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
          key: ValueKey('games-${DateTime.now()}'),
          type: BeamPageType.scaleTransition,
          child: const Padding(
            padding: EdgeInsets.all(
              8.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Просмотр',
                    style: GGTextStyle.mainHeaderStyle,
                  ),
                  GameListWidget()
                ],
              ),
            ),
          ),
      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/'];
}


class LobbyListLocation extends BeamLocation<BeamState> {
  LobbyListLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: ValueKey('game_lobbies - ${DateTime.now()}'),
        type: BeamPageType.scaleTransition,
        child: LobbyListWidget(
            gameName: state.pathPatternSegments[1]),

      ),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/game_lobbies'];
}

final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: (routeInformation, _) => GameListLocation(routeInformation),
);
