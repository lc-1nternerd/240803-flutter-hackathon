
import 'package:diefiaker/game/components/resource.dart';
import 'package:diefiaker/game/components/resource_type.dart';
import 'package:flutter/material.dart';

class IronResourceComponent extends ResourceComponent {
  IronResourceComponent({required super.position, required super.productionPerMinute, super.emitResourceCallback}) : super (
    color: Colors.brown,
    type: ResourceType.Iron
  );
}