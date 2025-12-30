import 'package:plugin_platform_interface/plugin_platform_interface.dart';

enum PermissionManager$Permission { video, audio }

abstract interface class PermissionManager {
  factory PermissionManager() => PermissionManagerChannel.instance.create();

  Future<bool> checkPermission(PermissionManager$Permission permission);
  Future<bool> requestPermissions(
    List<PermissionManager$Permission> permissions,
  );
}

abstract base class PermissionManagerChannel extends PlatformInterface {
  PermissionManagerChannel() : super(token: _token);

  static final _token = Object();

  static PermissionManagerChannel? _instance;

  static PermissionManagerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(PermissionManagerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  PermissionManager create();
}
