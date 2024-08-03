import 'dart:async';

import 'package:diefiaker/game/components/feather_resource.dart';
import 'package:diefiaker/game/components/iron_resource.dart';
import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/resource.dart';
import 'package:diefiaker/game/components/resource_type.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flutter/material.dart';

class MineComponent extends MachineComponent<ResourceComponent, MachineComponent> {
  MineComponent({
    required super.input,
    super.output,
    super.height = tileSize,
    super.width = tileSize,
    super.position
  });

  @override
  FutureOr<void> onLoad() {
    input.onProduce(produceResource);

    if (input is IronResourceComponent) {
      paint = Paint()..color=Colors.brown..style=PaintingStyle.fill;
    } else if (input is FeatherResourceComponent) {
      paint = Paint()..color=Colors.lightBlue..style=PaintingStyle.fill;
    }
  }

  produceResource(ResourceType type) {
    print("produced type $type");
  }

  @override
  void update(double dt) {
    
  }
}