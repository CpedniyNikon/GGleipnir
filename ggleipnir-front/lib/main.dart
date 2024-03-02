import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ggleipnir_front/routes/app_pages.dart';
import 'package:ggleipnir_front/widget/home_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    ProviderScope(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          home: const HomePage(),
          getPages: AppPages.pages,
        ),
      ),
  );
}

