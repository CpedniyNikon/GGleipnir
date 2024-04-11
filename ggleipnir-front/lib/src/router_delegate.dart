import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ggleipnir_front/pages/home_page/home_page.dart';
import 'package:ggleipnir_front/src/main.dart';

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

final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: (routeInformation, _) => HomeLocation(routeInformation),
);
