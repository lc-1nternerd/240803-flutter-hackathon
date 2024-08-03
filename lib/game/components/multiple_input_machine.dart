import 'package:diefiaker/game/components/machine.dart';
import 'package:flutter/material.dart';

abstract class MultiInputMachine<I extends MachineComponent> extends MachineComponent<MachineComponent> {
  final List<MachineComponent> inputs;

  MultiInputMachine({required super.position, 
      super.output,
      super.color = Colors.lime,
      required this.inputs,
      double height = 50,
      double width = 50,});
}