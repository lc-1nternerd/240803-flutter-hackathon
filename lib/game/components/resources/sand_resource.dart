import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class SandResourceComponent extends ResourceComponent {
  SandResourceComponent(
      {required super.position,
      required super.productionPerMinute,
      super.emitResourceCallback})
      : super(color: Colors.transparent, type: ResourceType.Sand);

  @override
  Future<void> onLoad() async {
    final sandSprite = await gameRef.loadSprite('sand-resource.png');
    add(
      SpriteComponent(
        sprite: sandSprite,
        size: size,
        position: Vector2(0, 0),
      ),
    );
    return super.onLoad();
  }
}
