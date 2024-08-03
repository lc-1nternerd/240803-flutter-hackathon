import 'dart:async';

import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/camera.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class DieFiakerGame extends FlameGame with TapDetector {

  DieFiakerGame() : super(camera: CameraComponent.withFixedResolution(width: gameWidth, height: gameHeight));

  @override
  Color backgroundColor() {
    return Colors.amber;
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    // Draw grid background
    // final background = BackgroundComponent();
    // add(background);

    add(MachineComponent(position: Vector2(tileSize/2, tileSize/2), height: tileSize, width: tileSize));
    add(MachineComponent(position: Vector2(gameWidth/2, gameHeight/2), height: tileSize, width: tileSize, color: Colors.blue));
  }

   @override
  void onTapDown(TapDownInfo info) {
    final position = info.eventPosition.widget;


    final gridX = (position.x / tileSize).round() * tileSize;
    final gridY = (position.y / tileSize).round() * tileSize;

    add(MachineComponent(
        position: Vector2(gridX , gridY),
        height: tileSize,
        width: tileSize,
        color: Colors.green));
  }
}