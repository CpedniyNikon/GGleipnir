import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/pages/home_page/home_page.dart';
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
