import 'package:flutter_test/flutter_test.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:camerax_platform_interface/camerax_platform_interface_platform_interface.dart';
import 'package:camerax_platform_interface/camerax_platform_interface_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraxPlatformInterfacePlatform
    with MockPlatformInterfaceMixin
    implements CameraxPlatformInterfacePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraxPlatformInterfacePlatform initialPlatform = CameraxPlatformInterfacePlatform.instance;

  test('$MethodChannelCameraxPlatformInterface is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraxPlatformInterface>());
  });

  test('getPlatformVersion', () async {
    CameraxPlatformInterface cameraxPlatformInterfacePlugin = CameraxPlatformInterface();
    MockCameraxPlatformInterfacePlatform fakePlatform = MockCameraxPlatformInterfacePlatform();
    CameraxPlatformInterfacePlatform.instance = fakePlatform;

    expect(await cameraxPlatformInterfacePlugin.getPlatformVersion(), '42');
  });
}
