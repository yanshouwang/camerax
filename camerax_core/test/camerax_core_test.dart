import 'package:flutter_test/flutter_test.dart';
import 'package:camerax_core/camerax_core.dart';
import 'package:camerax_core/camerax_core_platform_interface.dart';
import 'package:camerax_core/camerax_core_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraxCorePlatform 
    with MockPlatformInterfaceMixin
    implements CameraxCorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraxCorePlatform initialPlatform = CameraxCorePlatform.instance;

  test('$MethodChannelCameraxCore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraxCore>());
  });

  test('getPlatformVersion', () async {
    CameraxCore cameraxCorePlugin = CameraxCore();
    MockCameraxCorePlatform fakePlatform = MockCameraxCorePlatform();
    CameraxCorePlatform.instance = fakePlatform;
  
    expect(await cameraxCorePlugin.getPlatformVersion(), '42');
  });
}
