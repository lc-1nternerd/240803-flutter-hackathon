import 'dart:async';

import 'package:diefiaker/game/constants.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flutter/cupertino.dart';

class ResourceComponent extends CircleComponent {
  ResourceComponent({
    required super.position,
    required this.productionPerMinute,
    required this.emitResourceCallback,
  }) {
    super.radius = tileSize / 2;
    anchor = Anchor.center;
    createTimedResourceEmitter();
  }

  final VoidCallback emitResourceCallback;
  final double productionPerMinute;
  Timer? periodicProductionTimer;

  void createTimedResourceEmitter() {
    periodicProductionTimer?.cancel();
    periodicProductionTimer = null;
    periodicProductionTimer = Timer.periodic(
      Duration(seconds: (60 / productionPerMinute).toInt()),
      (Timer timer) {
        emitResourceCallback.call();
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
