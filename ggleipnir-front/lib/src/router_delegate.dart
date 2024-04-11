import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:ggleipnir_front/pages/home_page/home_page.dart';

final routerDelegate = BeamerDelegate(
  transitionDelegate: const NoAnimationTransitionDelegate(),
  locationBuilder: RoutesLocationBuilder(
    routes: {
      '/*': (context, state, data) => BeamPage(
            key: ValueKey('home-${DateTime.now()}'),
            type: BeamPageType.scaleTransition,
            child: const HomePage(),
          ),
    },
  ),
);
