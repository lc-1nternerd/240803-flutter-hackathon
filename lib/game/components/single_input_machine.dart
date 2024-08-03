import 'package:diefiaker/game/components/machine.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

abstract class SingleInputMachineComponent<I extends Component> extends MachineComponent<MachineComponent> {
  final I input;

  SingleInputMachineComponent({required super.position, required this.input, 
      super.output,
      super.color = Colors.green,
      double height = 50,
      double width = 50,});
}