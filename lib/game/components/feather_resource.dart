import 'package:diefiaker/game/components/resource.dart';
import 'package:diefiaker/game/components/resource_type.dart';
import 'package:flutter/material.dart';

class FeatherResourceComponent extends ResourceComponent {
  FeatherResourceComponent({required super.position, required super.productionPerMinute, super.emitResourceCallback}) : super (
    color: Colors.lightBlue,
    type: ResourceType.Feather
  );
}