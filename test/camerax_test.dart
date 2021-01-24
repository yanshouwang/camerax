import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:camerax/camerax.dart';

void main() {
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
    expect(await Camerax.platformVersion, '42');
  });
}
