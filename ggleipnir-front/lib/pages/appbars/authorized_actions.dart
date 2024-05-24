import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';

List<Widget> authorizedActions() {
  final Controller controller = Get.find();

  return <Widget>[
    const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text("Profile"),
    ),
    InkWell(
      onTap: () {
        controller.quitLobbies(controller.user.value.id);
        controller.isAuthorized.value = false;
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Log out"),
      ),
    ),
  ];
}
