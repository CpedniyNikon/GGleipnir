import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart' as transition;
import 'package:ggleipnir_front/controllers/controller.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/routes/app_pages.dart';
import 'package:ggleipnir_front/pages/home_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();

  Get.put(Controller());

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: transition.Transition.fade,
      home: const HomePage(),
      getPages: AppPages.pages,
    ),
  );
}