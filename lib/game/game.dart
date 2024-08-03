import 'dart:async';

import 'package:diefiaker/game/components/combiner_machine.dart';
import 'package:diefiaker/game/components/conveyor_belt.dart';
import 'package:diefiaker/game/components/machine.dart';
import 'package:diefiaker/game/components/mine.dart';
import 'package:diefiaker/game/components/resources/sand_resource.dart';
import 'package:diefiaker/game/components/resources/wood_resource.dart';
import 'package:diefiaker/game/constants.dart';
import 'package:diefiaker/game/controls/control_model.dart';
import 'package:diefiaker/game/recipe/recipes.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/image_composition.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'components/resources/feather_resource.dart';
import 'components/resources/iron_resource.dart';
import 'components/resources/resource.dart';

class DieFiakerGame extends FlameGame with TapDetector, DragCallbacks {
  DieFiakerGame()
      : super(
            camera: CameraComponent.withFixedResolution(
                width: gameWidth, height: gameHeight));

  @override
  Color backgroundColor() {
    return Colors.amber;
  }

  @override
  FutureOr<void> onLoad() {
    add(FeatherResourceComponent(
        position: Vector2(50, 50), productionPerMinute: 60));
    add(IronResourceComponent(
        position: Vector2(250, 300), productionPerMinute: 30));

    add(WoodResourceComponent(
        position: Vector2(200, 400), productionPerMinute: 80));

      
    add(SandResourceComponent(
        position: Vector2(100, 600), productionPerMinute: 30));
  }

  @override
  void onTapDown(TapDownInfo info) {
    final position = info.eventPosition.widget;
    final gridX = (position.x / tileSize).round() * tileSize;
    final gridY = (position.y / tileSize).round() * tileSize;
    final placePosition = Vector2(gridX, gridY);

    debugPrint('Control Type: ${ControlModel().controlType}');

    switch (ControlModel().controlType) {
      case ControlType.drag:
        // TODO: Handle this case.
        break;
      case ControlType.mine:
        placeMineComponent(placePosition: placePosition);
        break;

      case ControlType.conveyor:
        placeConveyorBelt(placePosition: placePosition);
        break;

      case ControlType.machine:
        placeMachineComponent(placePosition: placePosition);
        break;
    }
  }

  void placeMineComponent({required Vector2 placePosition}) {
    final components = componentsAtPoint(placePosition);

    if (components.whereType<MineComponent>().isNotEmpty) {
      debugPrint("wont place another mine if existing");
      return;
    }

    final resources = components.whereType<ResourceComponent>();

    if (resources.length == 1) {
      add(
        MineComponent(
          input: resources.first,
          position: placePosition,
          height: tileSize,
          width: tileSize,
        ),
      );
    }
  }

  void placeMachineComponent({required Vector2 placePosition}) async {
    // Get machine components on the current position
    final components =
        componentsAtPoint(placePosition).whereType<CombinerMachineComponent>();

    // We should at max find one component with type machine component
    CombinerMachineComponent? existingComponent;
    if (components.isNotEmpty) {
      existingComponent = components.first;
      debugPrint(
          'Existing component with type: ${existingComponent.runtimeType}');
    }

    MachineRecipe? selectedRecipe = await showDialog<MachineRecipe?>(
      context: buildContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select machine recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Wings"),
                    onTap: () {
                      Navigator.of(context).pop(WingRecipe());
                    },
                  ),
                  ListTile(
                    title: const Text("Feet"),
                    onTap: () {
                      Navigator.of(context).pop(FootRecipe());
                    },
                  ),
                  ListTile(
                    title: const Text("Body"),
                    onTap: () {
                      Navigator.of(context).pop(BodyRecipe());
                    },
                  ),
                  ListTile(
                    title: const Text("Beak"),
                    onTap: () {
                      Navigator.of(context).pop(BeakRecipe());
                    },
                  ),
                  ListTile(
                    title: const Text("Eyes"),
                    onTap: () {
                      Navigator.of(context).pop(EyesRecipe());
                    },
                  )
                ],
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );

    if (selectedRecipe != null) {
      final combiner = CombinerMachineComponent(
          position: placePosition,
          recipe: selectedRecipe,
          inputs: existingComponent?.inputs ?? [],
        );
      add(combiner);

      final adjacentComponents = checkSurroundingComponents(placePosition);

      for (final component in adjacentComponents) {
        if (component is ConveyorBeltComponent && component.output == null) {
          combiner.addInput(component);
          component.addOutput(combiner);
        }
      }
    }
  }

  placeConveyorBelt({required Vector2 placePosition}) {
    final components = componentsAtPoint(placePosition);

    if (components.whereType<MachineComponent>().isNotEmpty) {
      debugPrint("wont place a conveyor if existing machine component");
      return;
    }

    final adjacentComponents = checkSurroundingComponents(placePosition);

    if (adjacentComponents.whereType<MineComponent>().isNotEmpty ||
        adjacentComponents.whereType<ConveyorBeltComponent>().isNotEmpty ||
        adjacentComponents.whereType<CombinerMachineComponent>().isNotEmpty) {
      final input = adjacentComponents.whereType<MachineComponent>().first;

      if (input.output == null) {
        final currentBelt = ConveyorBeltComponent(
          position: placePosition,
          input: input,
          height: tileSize,
          width: tileSize,
        );

        input.output = currentBelt;

        add(currentBelt);

        return;
      }
    }
  }

  checkSurroundingComponents(Vector2 position) {
    final offsets = [
      Vector2(-tileSize, 0),
      Vector2(tileSize, 0),
      Vector2(0, tileSize),
      Vector2(0, -tileSize)
    ];

    final List<Component> foundComponents = [];
    for (var offset in offsets) {
      final adjacentComponents = componentsAtPoint(position + offset);
      foundComponents.addAll(adjacentComponents);
    }
    return foundComponents;
  }

// @override
// onDragUpdate(DragUpdateEvent details) {
//   print("dragging ${details.canvasDelta}");
// }
}
