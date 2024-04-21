import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/pages/appbars/authorized_actions.dart';
import 'package:ggleipnir_front/pages/appbars/unauthorized_actions.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/global_variables.dart';

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
    return AppBar(
      leading: IconButton(
        onPressed: () {
          controller.beamer.currentState?.routerDelegate.beamToNamed('/');
        },
        icon: const Icon(Icons.home),
      ),
      title: const Text('GGleipnir'),
      actions:
        GlobalVariables.isAuthorized ? authorizedActions : unAuthorizedActions,
      backgroundColor: Colors.green,
    );
  }
}
