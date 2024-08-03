import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ConveyorBeltComponent<I extends Component, O extends Component>
    extends RectangleComponent {
  final I input;
  O? output;

  ConveyorBeltComponent({
    required super.position,
    required this.input,
    this.output,
    Color color = Colors.pink,
    double height = 50,
    double width = 50,
  }) : super(
            anchor: Anchor.center,
            size: Vector2(height, width),
            paint: Paint()
              ..color = color
              ..style = PaintingStyle.fill);

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
