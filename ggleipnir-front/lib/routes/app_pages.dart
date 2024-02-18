import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ggleipnir_front/routes/routes.dart';
import 'package:ggleipnir_front/widget/home_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => const HomePage(),
    ),
  ];
}