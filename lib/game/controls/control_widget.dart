import 'package:diefiaker/game/controls/control_model.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ControlWidget extends StatefulWidget {
  const ControlWidget({super.key});

  @override
  State<ControlWidget> createState() => _ControlWidgetState();
}

class _ControlWidgetState extends State<ControlWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListenableBuilder(
        listenable: ControlModel(),
        builder: (context, child) {
          return SegmentedButton<ControlType>(
            segments: ControlType.values
                .map(
                  (controlType) => ButtonSegment<ControlType>(
                    value: controlType,
                    label: Text(controlType.name),
                    icon: getIcon(controlType),
                  ),
                )
                .toList(),
            selected: {ControlModel().controlType},
            showSelectedIcon: false,
            onSelectionChanged: (Set<ControlType> newSelection) {
              ControlModel().controlType = newSelection.first;
            },
          );
        },
      ),
    );
  }

  Icon getIcon(ControlType controlType) {
    IconData iconData;
    switch (controlType) {
      case ControlType.drag:
        iconData = Symbols.drag_pan;
      case ControlType.mine:
        iconData = Symbols.construction;
      case ControlType.conveyor:
        iconData = Symbols.conveyor_belt;
      case ControlType.machine:
        iconData = Symbols.precision_manufacturing;
    }
    return Icon(iconData);
  }
}
