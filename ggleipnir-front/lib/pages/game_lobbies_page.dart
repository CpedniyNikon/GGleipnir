import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ggleipnir_front/appbars/authorized_appbar.dart';
import 'package:ggleipnir_front/appbars/unauthorized_appbar.dart';
import 'package:ggleipnir_front/controllers/lobby_repository_controller.dart';
import 'package:ggleipnir_front/globals/global_variables.dart';
import 'package:ggleipnir_front/repositories/lobby_repository.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';

class GameLobbiesPage extends StatelessWidget {
  const GameLobbiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LobbyRepositoryController(
          LobbyRepository([]),
        )..getLobbyList(
          Get.parameters['gameName']!,
        ),
      child: Scaffold(
        appBar: GlobalVariables.isAuthorized
            ? const AuthorizedAppBar()
            : const UnAuthorizedAppBar() as PreferredSizeWidget,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                LobbyListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
