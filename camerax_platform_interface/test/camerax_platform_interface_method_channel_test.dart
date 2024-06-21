import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camerax_platform_interface/camerax_platform_interface_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelCameraxPlatformInterface platform = MethodChannelCameraxPlatformInterface();
  const MethodChannel channel = MethodChannel('camerax_platform_interface');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
