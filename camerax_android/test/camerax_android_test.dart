import 'package:flutter_test/flutter_test.dart';
import 'package:camerax_android/camerax_android.dart';
import 'package:camerax_android/camerax_android_platform_interface.dart';
import 'package:camerax_android/camerax_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockCameraxAndroidPlatform
    with MockPlatformInterfaceMixin
    implements CameraxAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final CameraxAndroidPlatform initialPlatform = CameraxAndroidPlatform.instance;

  test('$MethodChannelCameraxAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelCameraxAndroid>());
  });

  test('getPlatformVersion', () async {
    CameraxAndroid cameraxAndroidPlugin = CameraxAndroid();
    MockCameraxAndroidPlatform fakePlatform = MockCameraxAndroidPlatform();
    CameraxAndroidPlatform.instance = fakePlatform;

    expect(await cameraxAndroidPlugin.getPlatformVersion(), '42');
  });
}
