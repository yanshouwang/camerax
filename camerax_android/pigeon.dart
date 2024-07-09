// Run with `dart run pigeon --input pigeon.dart`.
import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  dartOut: 'lib/src/pigeon.g.dart',
  dartTestOut: 'test/test_pigeon.g.dart',
  dartOptions: DartOptions(),
  kotlinOut: 'android/src/main/kotlin/dev/hebei/camerax_android/Pigeon.g.kt',
  kotlinOptions: KotlinOptions(
    package: 'dev.hebei.camerax_android',
  ),
))
@HostApi(dartHostTestHandler: 'TestPermissionsManagerHostAPI')
abstract class PermissionsManagerHostAPI {
  @async
  bool requestPermissions(bool enableAudioArgs);
}
