import 'package:diefiaker/game/components/resources/resource_type.dart';

abstract class MachineRecipe {
  bool isDone(Map<ResourceType, int> resourceMap);
}

class WingRecipe extends MachineRecipe {
  @override
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap[ResourceType.Wood] == 5 &&
        resourceMap[ResourceType.Feather] == 10);
  }
}

class FootRecipe extends MachineRecipe {
  @override
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap[ResourceType.Wood] == 3);
  }
}

class BodyRecipe extends MachineRecipe {
  @override
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap[ResourceType.Iron] == 2 &&
        resourceMap[ResourceType.Feather] == 2);
  }
}

class BeakRecipe extends MachineRecipe {
  @override
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap[ResourceType.Wood] == 5 &&
        resourceMap[ResourceType.Iron] == 10);
  }
}

class EyesRecipe extends MachineRecipe {
  @override
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap[ResourceType.Sand] == 2 &&
        resourceMap[ResourceType.Iron] == 1);
  }
}
