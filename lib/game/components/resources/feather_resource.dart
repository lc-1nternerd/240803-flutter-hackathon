import 'package:diefiaker/game/components/resources/resource.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:flutter/material.dart';

class FeatherResourceComponent extends ResourceComponent {
  FeatherResourceComponent({required super.position, required super.productionPerMinute, super.emitResourceCallback}) : super (
    color: Colors.lightBlue,
    type: ResourceType.Feather
  );
}