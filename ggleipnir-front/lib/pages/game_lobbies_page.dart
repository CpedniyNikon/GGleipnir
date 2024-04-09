import 'package:dimension/dimension.dart';
import 'package:flutter/material.dart';
import 'package:ggleipnir_front/appbars/authorized_appbar.dart';
import 'package:ggleipnir_front/appbars/unauthorized_appbar.dart';
import 'package:ggleipnir_front/drawers/followed_games.dart';
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
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(microseconds: 300),
              width:
                  20.toVWLength.toPX(screenSize: MediaQuery.of(context).size),
            ),
            const VerticalDivider(
              width: 0,
            ),
            DimensionSizedBox(
              width: 80.toVWLength,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
