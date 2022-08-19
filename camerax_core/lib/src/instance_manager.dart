abstract class InstanceManager {
  int tryAddInstance<T>(T instance);
  void removeInstance<T>(T instance);
  T getInstance<T>(int instanceId);

  static final InstanceManager instance = _InstanceManager();
}

class _InstanceManager implements InstanceManager {
  final instances = <int, dynamic>{};
  final instanceIds = <dynamic, int>{};

  var instanceId = 0;

  @override
  int tryAddInstance<T>(T instance) {
    var instanceId = instanceIds[instance];
    if (instanceId == null) {
      instanceId = this.instanceId++;
      instanceIds[instance] = instanceId;
      instances[instanceId] = instance;
    }
    return instanceId;
  }

  @override
  void removeInstance<T>(T instance) {
    final instanceId = instanceIds[instance];
    instanceIds.remove(instance);
    instances.remove(instanceId);
  }

  @override
  T getInstance<T>(int instanceId) {
    return instances[instanceId];
  }
}
