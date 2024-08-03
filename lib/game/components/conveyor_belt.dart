import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/resource_type.dart';
import 'package:diefiaker/game/components/single_input_machine.dart';
import 'package:diefiaker/game/game.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class TimedResource {
  final ResourceType type;
  final DateTime addedAt;

  TimedResource(this.type, this.addedAt);
}

class ConveyorBeltComponent extends SingleInputMachineComponent<MachineComponent> with HasGameRef<DieFiakerGame> {

  List<TimedResource> currentResources = [];

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

    if (currentResources.isNotEmpty) {
      canvas.drawCircle(Offset(size.x/2, size.y/2), 20, Paint()..color=Colors.red..style=PaintingStyle.fill);
    }
  }

  @override
  push(ResourceType type) {
    print("pushed on belt $hashCode");

    currentResources.add(TimedResource(type, DateTime.now()));
  }

  @override
  void update(double dt) {
    final t = DateTime.now().add(Duration(microseconds: gameRef.currentTime().toInt()));
    
    final matchedResources = currentResources.where((res) => t.difference(res.addedAt).inSeconds >= 1).toList();  

    for (final r in matchedResources) {
      if (output != null) {
        output!.push(r.type);
      }
      currentResources.remove(r);
    }
  }
}
