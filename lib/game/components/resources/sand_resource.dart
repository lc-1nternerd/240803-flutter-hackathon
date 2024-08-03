import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flutter/material.dart';

class SandResourceComponent extends ResourceComponent {
  SandResourceComponent(
      {required super.position,
      required super.productionPerMinute,
      super.emitResourceCallback})
      : super(color: Colors.amber.shade700, type: ResourceType.Sand);
}
