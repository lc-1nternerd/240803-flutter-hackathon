import 'dart:async';

import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/multiple_input_machine.dart';
import 'package:diefiaker/game/components/resources/resource_type.dart';
import 'package:diefiaker/game/recipe/recipes.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class CombinerMachineComponent extends MultiInputMachine<MachineComponent> {
  MachineRecipe recipe;

  final Map<ResourceType, int> resourceMap = {};

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

  @override
  addInput(MachineComponent input) {
    print("adding input ${input.runtimeType}");
    inputs.add(input);
  }

  @override
  push(ResourceType type) {
    print("push on combiner machine $hashCode: $type");
    if (resourceMap[type] == null) {
      resourceMap[type] = 1;
    } else {
      resourceMap[type] = resourceMap[type]! + 1; 
    }

    if (recipe.isDone(resourceMap)) {
      print("machine is done");
      if (output != null) {
        output!.push(recipe.cook());
      }

      // for(final res in resourceMap.keys) {
      //    resourceMap[res] = resourceMap[res] - (recipe.ingredients && recipe.ingredients[res] ? recipe.ingredients[res] : 0);
      // }
    }
  }

  @override
  addOutput(MachineComponent<Component> component) {
    output = component;
  }
}
