import 'dart:async';

import 'package:diefiaker/game/components/resources/feather_resource.dart';
import 'package:diefiaker/game/components/resources/iron_resource.dart';
import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:diefiaker/game/components/resources/sand_resource.dart';
import 'package:diefiaker/game/components/resources/wood_resource.dart';
import 'package:diefiaker/game/components/single_input_machine.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:flutter/material.dart';

class MineComponent extends SingleInputMachineComponent<ResourceComponent> {
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
    } else if (input is SandResourceComponent) {
      paint = Paint()..color=Colors.amber.shade300..style=PaintingStyle.fill;
    } else if (input is WoodResourceComponent) {
      paint = Paint()..color=Colors.green.shade800..style=PaintingStyle.fill;
    }
  }

  produceResource(ResourceType type) {
    print("produced type $type");
    if (output != null) {
      output?.push(type);
    }
  }

  @override
  void update(double dt) {
    
  }
}