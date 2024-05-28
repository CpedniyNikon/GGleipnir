import 'package:flutter/material.dart';
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
    return Center(
      child: user != null
          ? Column(
              children: [
                Text(
                  'userId: ${user?.id}',
                  style: GGTypography.header1,
                ),
                Text(
                  'name: ${user?.name}',
                  style: GGTypography.header1,
                ),
                Text(
                  'info: ${user?.meta}',
                  style: GGTypography.header1,
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
