import 'package:flutter_test/flutter_test.dart';
import 'package:camerax/camerax.dart';
import 'package:camerax/camerax_platform_interface.dart';
import 'package:camerax/camerax_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraxPlatform
    with MockPlatformInterfaceMixin
    implements CameraxPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraxPlatform initialPlatform = CameraxPlatform.instance;

  test('$MethodChannelCamerax is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCamerax>());
  });

  test('getPlatformVersion', () async {
    Camerax cameraxPlugin = Camerax();
    MockCameraxPlatform fakePlatform = MockCameraxPlatform();
    CameraxPlatform.instance = fakePlatform;

    expect(await cameraxPlugin.getPlatformVersion(), '42');
  });
}
