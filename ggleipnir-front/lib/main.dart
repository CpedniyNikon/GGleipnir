import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/src/router_delegate.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  Get.put(Controller());

  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routeInformationParser: BeamerParser(),
    routerDelegate: routerDelegate,
  ));
}
