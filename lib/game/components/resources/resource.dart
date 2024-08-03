import 'dart:async';

import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flutter/cupertino.dart';

typedef ResourceCallback = void Function(ResourceType type);

class ResourceComponent<T extends ResourceType> extends CircleComponent
    with HasGameRef {
  ResourceType type;

  ResourceComponent({
    required super.position,
    required this.productionPerMinute,
    required Color color,
    required this.type,
    this.emitResourceCallback,
  }) {
    super.radius = tileSize / 2;

    super.paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    anchor = Anchor.center;
  }

  final VoidCallback? emitResourceCallback;
  final double productionPerMinute;
  Timer? periodicProductionTimer;

  onProduce(ResourceCallback callback) {
    periodicProductionTimer?.cancel();
    periodicProductionTimer = null;
    periodicProductionTimer = Timer.periodic(
      Duration(milliseconds: ((60 / productionPerMinute) * 1000).toInt()),
      (Timer timer) {
        callback(type);
      },
    );
  }

  @override
  void onRemove() {
    super.onRemove();
    periodicProductionTimer?.cancel();
    periodicProductionTimer = null;
  }
}
