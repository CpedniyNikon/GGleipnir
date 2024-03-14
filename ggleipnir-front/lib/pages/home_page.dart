import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ggleipnir_front/controllers/game_repository_controller.dart';
import 'package:ggleipnir_front/repositories/game_repository.dart';
import 'package:ggleipnir_front/widget/game_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocProvider(
                  create: (BuildContext context) => GameRepositoryController(
                    GameRepository([]),
                      )..getGameList(),
                  child: const GameListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
