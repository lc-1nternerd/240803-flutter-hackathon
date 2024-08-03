import 'package:diefiaker/game/components/resources/resource_type.dart';

abstract class MachineRecipe {
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (resourceMap.keys.every((r) => ingredients[r] == resourceMap[r]));
  }

  Map<ResourceType, int> get ingredients;

  ResourceType cook();
}

class WingRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Wood: 5,
    ResourceType.Feather: 5,
  };

  @override
  ResourceType cook() {
    return ResourceType.Wing;
  }
}

class FootRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Wood: 3,
  };

  @override
  ResourceType cook() {
    return ResourceType.Foot;
  }
}

class BodyRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Iron: 2,
    ResourceType.Feather: 2,
  };

  @override
  ResourceType cook() {
    return ResourceType.Body;
  }
}

class BeakRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Wood: 5,
    ResourceType.Iron: 10,
  };

  @override
  ResourceType cook() {
    return ResourceType.Beak;
  }
}

class EyesRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Sand: 2,
    ResourceType.Iron: 1,
  };

  @override
  ResourceType cook() {
    return ResourceType.Eye;
  }
}
