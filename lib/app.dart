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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Scaffold(
      //   body: SafeArea(child: FittedBox(
      //     alignment: Alignment.center,
      //     child: SizedBox(
      //       height: gameHeight,
      //       width: gameWidth,
      //       child: 
      //     ),
      //   )),
      // ),
      home: Scaffold(
        body: SafeArea(child: GameWidget(game: DieFiakerGame()),),
      ),
    );
  }
}