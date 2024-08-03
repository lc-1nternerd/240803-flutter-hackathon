import 'dart:async';

import 'package:diefiaker/game/components/combiner_machine.dart';
import 'package:diefiaker/game/game.dart';
import 'package:diefiaker/game/recipe/recipes.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class DashCombiner extends CombinerMachineComponent with HasGameRef<DieFiakerGame> {
  DashCombiner({required super.position}): super(recipe: DashRecipe());

  @override
  FutureOr<void> onLoad() async {
    final sprite = await Sprite.load('dash.png');
    
    add(SpriteComponent(sprite: sprite, size: size));
  }

  @override
  Future<void> onCook() async {
    gameRef.pauseEngine();
    
    await showDialog<MachineRecipe?>(
      context: gameRef.buildContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('YAAAAY'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                Text("You just built a Dash, congraaaazzzz!")
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );

    return;
  }

}