import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flutter/material.dart';

class WoodResourceComponent extends ResourceComponent {
  WoodResourceComponent(
      {required super.position,
      required super.productionPerMinute,
      super.emitResourceCallback})
      : super(color: Colors.green.shade800, type: ResourceType.Wood);
}
