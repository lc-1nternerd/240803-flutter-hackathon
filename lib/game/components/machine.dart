import 'package:diefiaker/game/components/resource_type.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

abstract class MachineComponent<O extends Component> extends RectangleComponent {
  O? output;

  MachineComponent(
      {required super.position,
      this.output,
      Color color = Colors.pink,
      double height = 50,
      double width = 50,})
      : super(
            anchor: Anchor.center,
            size: Vector2(height, width),
            paint: Paint()
              ..color = color
              ..style = PaintingStyle.fill);

  push(ResourceType type) => {};
}
