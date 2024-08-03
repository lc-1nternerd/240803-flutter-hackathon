import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class FeatherResourceComponent extends ResourceComponent {
  FeatherResourceComponent(
      {required super.position,
      required super.productionPerMinute,
      super.emitResourceCallback})
      : super(color: Colors.transparent, type: ResourceType.Feather);

  @override
  Future<void> onLoad() async {
    final bgSprite = await gameRef.loadSprite('feather-resource-bg.png');
    add(
      SpriteComponent(
        sprite: bgSprite,
        size: size,
        position: Vector2(0, 0),
      ),
    );
    final featherSprite = await gameRef.loadSprite('feather-resource.png');
    add(
      SpriteComponent(
        sprite: featherSprite,
        size: size * 0.95,
        position: Vector2(0, 0),
      ),
    );
    return super.onLoad();
  }
}
