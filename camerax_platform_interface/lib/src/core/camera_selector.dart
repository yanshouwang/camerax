import 'package:camerax_platform_interface/src/camerax_plugin.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'lens_facing.dart';

final _token = Object();

abstract interface class CameraSelector {
  static CameraSelector get front {
    final instance = CameraXPlugin.instance.newFrontCameraSelector();
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  static CameraSelector get back {
    final instance = CameraXPlugin.instance.newBackCameraSelector();
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  static CameraSelector get external {
    final instance = CameraXPlugin.instance.newExternalCameraSelector();
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }

  factory CameraSelector({
    LensFacing? lensFacing,
  }) {
    final instance = CameraXPlugin.instance.newCameraSelector(
      lensFacing: lensFacing,
    );
    PlatformInterface.verify(instance as PlatformInterface, _token);
    return instance;
  }
}

abstract base class CameraSelectorChannel extends PlatformInterface
    implements CameraSelector {
  CameraSelectorChannel.impl() : super(token: _token);
}
