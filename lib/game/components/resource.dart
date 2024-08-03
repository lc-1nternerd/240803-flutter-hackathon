import 'dart:async';

import 'package:diefiaker/game/components/resource_type.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flame/components.dart' hide Timer;
import 'package:flutter/cupertino.dart';

typedef ResourceCallback = void Function(ResourceType type);

class ResourceComponent<T extends ResourceType> extends CircleComponent {
  ResourceType type;

  ResourceComponent({
    required super.position,
    required this.productionPerMinute,
    required Color color,
    required this.type,
    this.emitResourceCallback,
  }) {
    super.radius = tileSize / 2;

    super.paint = Paint()..color = color..style=PaintingStyle.fill;

    anchor = Anchor.center;
  }

  final VoidCallback? emitResourceCallback;
  final double productionPerMinute;
  Timer? periodicProductionTimer;

  // void createTimedResourceEmitter() {
  //   periodicProductionTimer?.cancel();
  //   periodicProductionTimer = null;
  //   periodicProductionTimer = Timer.periodic(
  //     Duration(seconds: (60 / productionPerMinute).toInt()),
  //     (Timer timer) {
  //       emitResourceCallback?.call();
  //     },
  //   );
  // }

  onProduce(ResourceCallback callback) {
    periodicProductionTimer?.cancel();
    periodicProductionTimer = null;
    periodicProductionTimer = Timer.periodic(
      Duration(seconds: (60 / productionPerMinute).toInt()),
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
