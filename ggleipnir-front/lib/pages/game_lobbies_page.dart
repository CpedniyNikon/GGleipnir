import 'package:flutter/material.dart';
import 'package:ggleipnir_front/widget/lobby_list_widget.dart';

class GameLobbiesPage extends StatelessWidget {
  const GameLobbiesPage({super.key});

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
              LobbyListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
