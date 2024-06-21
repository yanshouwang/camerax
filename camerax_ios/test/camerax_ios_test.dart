import 'package:flutter_test/flutter_test.dart';
import 'package:camerax_ios/camerax_ios.dart';
import 'package:camerax_ios/camerax_ios_platform_interface.dart';
import 'package:camerax_ios/camerax_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraxIosPlatform
    with MockPlatformInterfaceMixin
    implements CameraxIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraxIosPlatform initialPlatform = CameraxIosPlatform.instance;

  test('$MethodChannelCameraxIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraxIos>());
  });

  test('getPlatformVersion', () async {
    CameraxIos cameraxIosPlugin = CameraxIos();
    MockCameraxIosPlatform fakePlatform = MockCameraxIosPlatform();
    CameraxIosPlatform.instance = fakePlatform;

    expect(await cameraxIosPlugin.getPlatformVersion(), '42');
  });
}
