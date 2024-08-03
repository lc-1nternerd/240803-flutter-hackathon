import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class IronResourceComponent extends ResourceComponent {
  IronResourceComponent(
      {required super.position,
      required super.productionPerMinute,
      super.emitResourceCallback})
      : super(color: Colors.transparent, type: ResourceType.Iron);

  @override
  Future<void> onLoad() async {
    final ironSprite = await gameRef.loadSprite('iron-resource.png');
    add(
      SpriteComponent(
        sprite: ironSprite,
        size: size,
        position: Vector2(0, 0),
      ),
    );
    return super.onLoad();
  }
}
