import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';

class AuthorizedActions extends StatefulWidget {
  const AuthorizedActions({super.key});

  @override
  State<AuthorizedActions> createState() => _AuthorizedActionsState();
}

class _AuthorizedActionsState extends State<AuthorizedActions> {
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            controller.quitLobbies(controller.user.value.id);
            controller.isAuthorized.value = false;
            controller.beamer!.currentState?.routerDelegate
                .beamToNamed('/');
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Log out",
              style: GGTypography.header2,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            controller.beamer?.currentState?.routerDelegate
                .beamToNamed('/profile/${controller.user.value.id}');
          },
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.account_circle_outlined),
          ),
        ),
      ],
    );
  }
}
