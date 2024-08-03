import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class MovableItem extends PositionComponent {
  final Paint paint;
  final List<Vector2> path;
  final double ratePerMinute;
  late final double speed;
  int currentTargetIndex = 0;

  MovableItem({
    required Vector2 position,
    required Color color,
    required this.path,
    required this.ratePerMinute,
  })  : paint = Paint()..color = color,
        super(position: position, size: Vector2.all(20)) {
    // Calculate speed based on ratePerMinute
    // One tile is 50x50, so speed = distance / time
    // 60 items per minute means 1 item per second if distance is 50 pixels
    speed = 50.0 * ratePerMinute / 60.0;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), paint);
  }

  @override
  void update(double dt) {
    if (currentTargetIndex < path.length) {
      Vector2 target = path[currentTargetIndex];
      Vector2 direction = (target - position).normalized();
      position += direction * speed * dt;

      if ((target - position).length < speed * dt) {
        position.setFrom(target);
        currentTargetIndex++;
      }
    }
  }

  void addTarget(Vector2 target) {
    path.add(target);
  }
}
