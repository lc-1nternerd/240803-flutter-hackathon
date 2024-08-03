import 'dart:async';

import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/multiple_input_machine.dart';
import 'package:diefiaker/game/recipe/recipes.dart';
import 'package:flutter/material.dart';

class CombinerMachineComponent extends MultiInputMachine<MachineComponent> {
  MachineRecipe recipe;

  CombinerMachineComponent(
      {required super.position,
      required this.recipe,
      super.inputs = const [],
      super.color,
      super.height,
      super.width });

  @override
  FutureOr<void> onLoad() {
    if (recipe is WingRecipe) {
      paint.color = Colors.blueAccent;
    } else if (recipe is FootRecipe) {
      paint.color = Colors.brown.shade700;
    } else if (recipe is BodyRecipe) {
      paint.color = Colors.lightBlue.shade600;
    } else if (recipe is BeakRecipe) {
      paint.color = Colors.yellowAccent;
    } else if (recipe is EyesRecipe) {
      paint.color = Colors.black38;
    }
  }
}
