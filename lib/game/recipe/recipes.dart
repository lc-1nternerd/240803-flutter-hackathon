import 'package:diefiaker/game/components/resources/resource_type.dart';

abstract class MachineRecipe {
  bool isDone(Map<ResourceType, int> resourceMap) {
    return (ingredients.keys.every((r) {
      if (resourceMap[r] == null) {
        return false;
      }
      return resourceMap[r]! >= ingredients[r]!;
    }));
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

class DashRecipe extends MachineRecipe {
  @override
  Map<ResourceType, int> get ingredients => {
    ResourceType.Wing: 2,
    ResourceType.Foot: 2,
    ResourceType.Body: 10,
    ResourceType.Beak: 1,
    ResourceType.Eye: 2,
  };

  @override
  ResourceType cook() {
    return ResourceType.Dash;
  }
}