import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ggleipnir_front/controllers/http_client_controller.dart';
import 'package:ggleipnir_front/models/game_model.dart';
import 'package:ggleipnir_front/widget/room_list_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _ConsumerState();
}

class _ConsumerState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('GGleipnir'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Profile"),
          ),
        ],
        backgroundColor: Colors.green,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              RoomListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
