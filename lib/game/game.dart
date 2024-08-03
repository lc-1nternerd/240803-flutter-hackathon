import 'dart:async';

import 'package:diefiaker/game/components/conveyor_belt.dart';
import 'package:diefiaker/game/components/feather_resource.dart';
import 'package:diefiaker/game/components/iron_resource.dart';
import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/mine.dart';
import 'package:diefiaker/game/components/resource.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class DieFiakerGame extends FlameGame with TapDetector, DragCallbacks {

  DieFiakerGame() : super(camera: CameraComponent.withFixedResolution(width: gameWidth, height: gameHeight));

  @override
  Color backgroundColor() {
    return Colors.amber;
  }

  @override
  FutureOr<void> onLoad() {
    add(FeatherResourceComponent(
        position: Vector2(50, 50), productionPerMinute: 60));
    add(IronResourceComponent(
        position: Vector2(250, 300), productionPerMinute: 30));
  }

  @override
  void onTapDown(TapDownInfo info) {
    final position = info.eventPosition.widget;
    final gridX = (position.x / tileSize).round() * tileSize;
    final gridY = (position.y / tileSize).round() * tileSize;
    final placePosition = Vector2(gridX, gridY);

    final offsets = [
      Vector2(-tileSize, 0),
      Vector2(tileSize, 0),
      Vector2(0, tileSize),
      Vector2(0, -tileSize)
    ];

    for (var offset in offsets) {
      final adjacentComponents =
          componentsAtPoint(Vector2(gridX, gridY) + offset);

      if (adjacentComponents.whereType<MineComponent>().isNotEmpty ||
          adjacentComponents.whereType<ConveyorBeltComponent>().isNotEmpty) {
        final input = adjacentComponents.whereType<MachineComponent>().first;

        if (input.output == null) {
          final currentBelt = ConveyorBeltComponent(
            position: placePosition,
            input: input,
            height: tileSize,
            width: tileSize,
          );

          input.output = currentBelt;

          add(currentBelt);

          return;
        }
      }
    }

    final components = componentsAtPoint(placePosition);

    if (components.whereType<MineComponent>().isNotEmpty) {
      print("wont place another mine if existing");
      return;
    }

    final resources = components.whereType<ResourceComponent>();

    if (resources.length == 1) {
      add(MineComponent(
        input: resources.first,
        position: placePosition,
        height: tileSize,
        width: tileSize,
      ));
    }
  }

  // @override
  // onDragUpdate(DragUpdateEvent details) {
  //   print("dragging ${details.canvasDelta}");
  // }
}
