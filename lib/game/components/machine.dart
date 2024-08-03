import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MachineComponent<I extends Component, O extends Component> extends RectangleComponent {
  final I input;
  O? output;

  MachineComponent(
      {required super.position,
      required this.input,
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

}
