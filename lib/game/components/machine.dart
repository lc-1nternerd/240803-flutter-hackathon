import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MachineComponent extends RectangleComponent {
  MachineComponent(
      {required super.position,
      Color color = Colors.pink,
      double height = 50,
      double width = 50})
      : super(
            anchor: Anchor.center,
            size: Vector2(height, width),
            paint: Paint()
              ..color = color
              ..style = PaintingStyle.fill);
}
