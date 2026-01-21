import 'dart:io';

import 'package:jnigen/jnigen.dart';
import 'package:logging/logging.dart';

void main() async {
  final root = Platform.script.resolve('../');
  final config = Config(
    outputConfig: OutputConfig(
      dartConfig: DartCodeOutputConfig(
        path: root.resolve('lib/src/jni/'),
        structure: OutputStructure.packageStructure,
      ),
    ),
    classes: [
      'androidx.camera.view.CameraController',
      'androidx.camera.view.LifecycleCameraController',
      'androidx.camera.view.PreviewView',
      'androidx.camera.view.video.AudioConfig',
      // 'kotlinx.coroutines.guava.ListenableFutureKt',
    ],
    sourcePath: [root.resolve('android/src/main/kotlin/')],
    androidSdkConfig: AndroidSdkConfig(
      addGradleDeps: true,
      androidExample: '../camerax/example/',
    ),
    nonNullAnnotations: ['android.annotation.NonNull'],
    nullableAnnotations: ['android.annotation.Nullable'],
    logLevel: Level.ALL,
  );
  await generateJniBindings(config);
}
