import 'package:flutter/material.dart';
import 'package:ggleipnir_front/app_bars/authorized_app_bar.dart';
import 'package:ggleipnir_front/app_bars/unauthorized_app_bar.dart';
import 'package:ggleipnir_front/globals/global_variables.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';

class GameLobbiesPage extends StatelessWidget {
  const GameLobbiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalVariables.isAuthorized
          ? const AuthorizedAppBar()
          : const UnAuthorizedAppBar() as PreferredSizeWidget,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LobbyListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
