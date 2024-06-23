import 'pigeon.g.dart';

abstract interface class PermissionsManager {
  Future<bool> requestPermissions(bool enableAudio);

  factory PermissionsManager() => AndroidPermissionsManager.instance;
}

final class AndroidPermissionsManager implements PermissionsManager {
  static final _api = PermissionsManagerHostAPI();
  static final instance = AndroidPermissionsManager._instance();

  AndroidPermissionsManager._instance();

  @override
  Future<bool> requestPermissions(bool enableAudio) async {
    final granted = await _api.requestPermissions(enableAudio);
    return granted;
  }
}
