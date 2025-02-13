import 'dart:async';

import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/resources/feather_resource.dart';
import 'package:diefiaker/game/components/resources/iron_resource.dart';
import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:diefiaker/game/components/resources/sand_resource.dart';
import 'package:diefiaker/game/components/resources/wood_resource.dart';
import 'package:diefiaker/game/components/single_input_machine.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:diefiaker/game/movable_item.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../game.dart';

class MineComponent extends SingleInputMachineComponent<ResourceComponent>
    with HasGameRef<DieFiakerGame> {
  MineComponent(
      {required super.input,
      super.output,
      super.height = tileSize,
      super.width = tileSize,
      super.position});

  List<Vector2> path = [];

  @override
  Future<void> onLoad() async {
    input.onProduce(produceResource);

    if (input is IronResourceComponent) {
      paint = Paint()
        ..color = Colors.brown
        ..style = PaintingStyle.fill;
    } else if (input is FeatherResourceComponent) {
      paint = Paint()
        ..color = Colors.lightBlue
        ..style = PaintingStyle.fill;
    } else if (input is SandResourceComponent) {
      paint = Paint()
        ..color = Colors.amber.shade700
        ..style = PaintingStyle.fill;
    } else if (input is WoodResourceComponent) {
      paint = Paint()
        ..color = Colors.green.shade800
        ..style = PaintingStyle.fill;
    }
    final ironSprite = await gameRef.loadSprite('mine.png');
    add(
      SpriteComponent(
        sprite: ironSprite,
        size: size,
        position: Vector2(0, 0),
      ),
    );
    super.onLoad();
  }

  produceResource(ResourceType type) {
    print("produced type $type");
    if (output != null) {
      output?.push(type);
    }

    if (output != null) {
      output?.push(type);
    }

    if (path.isNotEmpty) {
      final List<Vector2> newList = [];

      for (var i = 0; i < path.length; i++) {
        newList.add(
            // path[i] + Vector2(-250, -300),

            path[i]);
      }

      var color = Colors.brown;

      if (input is IronResourceComponent) {
        color = Colors.brown;
      } else if (input is FeatherResourceComponent) {
        color = Colors.lightBlue;
      } else if (input is SandResourceComponent) {
        color = Colors.amber;
      } else if (input is WoodResourceComponent) {
        color = Colors.green;
      }

      add(
        MovableItem(
          position: newList.first,
          path: newList,
          ratePerMinute: 60,
          color: color,
        ),
      );
    }
  }

  @override
  addOutput(MachineComponent<Component> component) {
    output = component;
  }

  addPath(List<Vector2> pathToSet) {
    print(pathToSet);

    path = pathToSet;
  }

  @override
  void update(double dt) {}
}
