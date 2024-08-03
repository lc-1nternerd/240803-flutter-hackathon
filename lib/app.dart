import 'package:diefiaker/game/controls/control_widget.dart';
import 'package:diefiaker/game/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class GameApp extends StatefulWidget {
  const GameApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return GameAppState();
  }
}

class GameAppState extends State<GameApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Die FICKER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.tealAccent,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Expanded(
                child: GameWidget(
                  game: DieFiakerGame(),
                ),
              ),
              const Align(
                alignment: Alignment.bottomCenter,
                child: ControlWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
