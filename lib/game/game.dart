import 'dart:async';

import 'package:diefiaker/game/components/feather_resource.dart';
import 'package:diefiaker/game/components/iron_resource.dart';
import 'package:diefiaker/game/components/mine.dart';
import 'package:diefiaker/game/components/resource.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/components.dart';
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
    add(FeatherResourceComponent(position: Vector2(50, 50), productionPerMinute: 60));
    add(IronResourceComponent(position: Vector2(250, 300), productionPerMinute: 30));
    
  }


   @override
  void onTapDown(TapDownInfo info) {
    final position = info.eventPosition.widget;

    final gridX = (position.x / tileSize).round() * tileSize;
    final gridY = (position.y / tileSize).round() * tileSize;

    final components = componentsAtPoint(Vector2(gridX, gridY));

    if (components.whereType<MineComponent>().isNotEmpty) {
      print("wont place another mine if existing");
      return;
    }

    final resources = components.whereType<ResourceComponent>();

    if (resources.length == 1) {
      add(MineComponent(
        input: resources.first,
        position: Vector2(gridX , gridY),
        height: tileSize,
        width: tileSize));
    }
  }
}