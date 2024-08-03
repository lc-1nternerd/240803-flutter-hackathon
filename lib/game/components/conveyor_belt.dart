import 'package:diefiaker/game/components/machine.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ConveyorBeltComponent extends MachineComponent<MachineComponent, MachineComponent> {

  ConveyorBeltComponent({
    required super.position,
    required super.input,
    super.output,
    super.height = 50,
    super.width = 50,
  });

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    // Draw the conveyor belt background
    paint.color = Colors.grey.shade800;
    canvas.drawRect(size.toRect(), paint);

    // Draw the conveyor belt lines
    final linePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4.0;

    const double lineSpacing = 10.0;
    final int numberOfLines = (size.y / lineSpacing).ceil();

    for (int i = 0; i <= numberOfLines; i++) {
      final y = i * lineSpacing;
      canvas.drawLine(Offset(0, y), Offset(size.x, y), linePaint);
    }
  }
}
