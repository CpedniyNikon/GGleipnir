import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/pages/appbars/authorized_actions.dart';
import 'package:ggleipnir_front/pages/appbars/unauthorized_actions.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';

class GGAppBar extends StatefulWidget implements PreferredSizeWidget {
  const GGAppBar({super.key});

  @override
  State<GGAppBar> createState() => _GGAppBarState();

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);
}

class _GGAppBarState extends State<GGAppBar> {
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
        leading: IconButton(
          onPressed: () {
            controller.beamer.currentState?.routerDelegate.beamToNamed('/');
          },
          icon: const Icon(Icons.home),
        ),
        title: const Text('GGleipnir'),
        actions: controller.isAuthorized.value
            ? authorizedActions()
            : unAuthorizedActions(context),
      ),
    );
  }
}
