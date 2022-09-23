import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camerax/camerax_method_channel.dart';

void main() {
  MethodChannelCamerax platform = MethodChannelCamerax();
  const MethodChannel channel = MethodChannel('camerax');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
