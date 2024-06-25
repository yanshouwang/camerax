import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:jni/jni.dart';

import 'jni.g.dart' as jni;

abstract class JNI {
  static JObject get activity {
    final reference = Jni.getCurrentActivity();
    return JObject.fromReference(reference);
  }
}

extension LensFacingX on LensFacing {
  int get jniValue {
    switch (this) {
      case LensFacing.front:
        return jni.CameraSelector.LENS_FACING_FRONT;
      case LensFacing.back:
        return jni.CameraSelector.LENS_FACING_BACK;
      case LensFacing.external:
        return jni.CameraSelector.LENS_FACING_EXTERNAL;
    }
  }
}

extension CameraSelectorX on CameraSelector {
  jni.CameraSelector get jniValue {
    if (this == CameraSelector.back) {
      return jni.CameraSelector.DEFAULT_BACK_CAMERA;
    } else if (this == CameraSelector.front) {
      return jni.CameraSelector.DEFAULT_FRONT_CAMERA;
    } else {
      return jni.CameraSelector_Builder()
          .requireLensFacing(lensFacing.jniValue)
          .build();
    }
  }
}

extension ScaleTypeX on ScaleType {
  jni.PreviewView_ScaleType get jniValue {
    switch (this) {
      case ScaleType.fillCenter:
        return jni.PreviewView_ScaleType.FILL_CENTER;
      case ScaleType.fillStart:
        return jni.PreviewView_ScaleType.FILL_START;
      case ScaleType.fillEnd:
        return jni.PreviewView_ScaleType.FILL_END;
      case ScaleType.fitCenter:
        return jni.PreviewView_ScaleType.FIT_CENTER;
      case ScaleType.fitStart:
        return jni.PreviewView_ScaleType.FIT_START;
      case ScaleType.fitEnd:
        return jni.PreviewView_ScaleType.FIT_END;
    }
  }
}

extension JNIZoomStateX on jni.ZoomState {
  ZoomState get dartValue {
    final minZoomRatio = getMinZoomRatio();
    final maxZoomRatio = getMaxZoomRatio();
    final linearZoom = getLinearZoom();
    final zoomRatio = getZoomRatio();
    return ZoomState(
      minZoomRatio: minZoomRatio,
      maxZoomRatio: maxZoomRatio,
      linearZoom: linearZoom,
      zoomRatio: zoomRatio,
    );
  }
}
