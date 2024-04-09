import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart'
    as transition;
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/pages/game_lobbies_page.dart';
import 'package:ggleipnir_front/routes/app_pages.dart';
import 'package:ggleipnir_front/pages/home_page.dart';
import 'package:url_strategy/url_strategy.dart';

class HomeLocation extends BeamLocation<BeamState> {
  HomeLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
          key: ValueKey('home-${DateTime.now()}'), child: const HomePage()),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/*'];
}

class GameLobbiesLocation extends BeamLocation<BeamState> {
  GameLobbiesLocation(RouteInformation routeInformation)
      : super(routeInformation);

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
          key: ValueKey('game_lobbies'),
          child: GameLobbiesPage(),
          type: BeamPageType.fadeTransition),
    ];
  }

  @override
  List<Pattern> get pathPatterns => ['/game_lobbies*'];
}

void main() {
  setPathUrlStrategy();

  Get.put(Controller());

  final routerDelegate = BeamerDelegate(
    transitionDelegate: const NoAnimationTransitionDelegate(),
    locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
  );

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routeInformationParser: BeamerParser(),
    routerDelegate: routerDelegate,
  ));
}
