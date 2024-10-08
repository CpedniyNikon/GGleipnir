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

  callback() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(height: 1),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                controller.beamer!.currentState?.routerDelegate
                    .beamToNamed('/');
              },
              child: const Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 20,
                  ),
                  Text('GGleipnir'),
                ],
              ),
            ),
            Expanded(child: Container()),
            controller.isAuthorized.value
                ? const AuthorizedActions()
                : const UnAuthorizedActions(),
          ],
        ),
      ),
    );
  }
}
