import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ggleipnir_front/core/controllers/controller.dart';
import 'package:ggleipnir_front/core/globals/constants/gg_typography.dart';
import 'package:ggleipnir_front/core/models/user_model.dart';

class ProfileWidget extends StatefulWidget {
  final String userId;

  const ProfileWidget({super.key, required this.userId});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final Controller controller = Get.find();

  UserModel? user;

  @override
  void initState() {
    _fetchUser();
    super.initState();
  }

  _fetchUser() async {
    user = await controller.getUser(widget.userId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: user != null
          ? Stack(
              children: [
                Positioned(
                  top: 20,
                  right: 20,
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.memory(
                          width: 200,
                          height: 200,
                          base64Decode(user!.image),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Text(
                        '${user?.name}',
                        style: GGTypography.mainHeaderStyle,
                      ),
                    ],
                  ),
                )
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
