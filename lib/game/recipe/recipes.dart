import 'package:diefiaker/game/components/resource_type.dart';

abstract class MachineRecipe {
  final Map<ResourceType, int> resourceMap = {};

  addResource(ResourceType type) {
    if (resourceMap[type] == null) {
      resourceMap[type] = 1;
      return;
    }

    resourceMap[type] = resourceMap[type]! + 1;
  }

  bool isDone();
}

class WingRecipe extends MachineRecipe {
  @override
  bool isDone() {
    return (resourceMap[ResourceType.Wood] == 5 &&
        resourceMap[ResourceType.Feather] == 10);
  }
}

class FootRecipe extends MachineRecipe {
  @override
  bool isDone() {
    return (resourceMap[ResourceType.Wood] == 3);
  }
}

class BodyRecipe extends MachineRecipe {
  @override
  bool isDone() {
    return (resourceMap[ResourceType.Iron] == 2 &&
        resourceMap[ResourceType.Feather] == 2);
  }
}

class BeakRecipe extends MachineRecipe {
  @override
  bool isDone() {
    return (resourceMap[ResourceType.Wood] == 5 &&
        resourceMap[ResourceType.Iron] == 10);
  }
}

class EyesRecipe extends MachineRecipe {
  @override
  bool isDone() {
    return (resourceMap[ResourceType.Sand] == 2 &&
        resourceMap[ResourceType.Iron] == 1);
  }
}
