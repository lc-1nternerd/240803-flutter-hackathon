import 'dart:async';

import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class DieFiakerGame extends FlameGame {
  @override
  Color backgroundColor() {
    return Colors.amber;
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    camera.viewport = FixedResolutionViewport(
      resolution: Vector2(
          gameWidth, gameHeight),
    );

    // Draw grid background
    // final background = BackgroundComponent();
    // add(background);

    world.add(MachineComponent(position: Vector2.all(0), height: tileSize, width: tileSize));
    world.add(MachineComponent(position: Vector2(0, -tileSize), height: tileSize, width: tileSize, color: Colors.blue));
  }
}