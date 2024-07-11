import 'dart:ffi';
import 'dart:ui';

import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'ffi.g.dart' as ffi;

const _avfoundationPath =
    '/System/Library/Frameworks/AVFoundation.framework/AVFoundation';
final _avFoundationLib = DynamicLibrary.open(_avfoundationPath);
final avFoundationLib = ffi.CameraXiOSLibrary(_avFoundationLib);

extension ScaleTypeX on ScaleType {
  ffi.DartAVLayerVideoGravity get ffiValue {
    final ffi.AVLayerVideoGravity videoGravityPtr;
    switch (this) {
      case ScaleType.fillStart:
      case ScaleType.fillCenter:
      case ScaleType.fillEnd:
        videoGravityPtr = avFoundationLib.AVLayerVideoGravityResizeAspectFill;
        break;
      case ScaleType.fitStart:
      case ScaleType.fitEnd:
      case ScaleType.fitCenter:
        videoGravityPtr = avFoundationLib.AVLayerVideoGravityResizeAspect;
        break;
    }
    final videoGravity =
        ffi.DartAVLayerVideoGravity.castFromPointer(videoGravityPtr);
    return videoGravity;
  }
}

extension FFIPreviewViewX on ffi.PreviewView {
  Future<void> setSessionOnMainThread(ffi.AVCaptureSession session) async {
    final viewPtr = pointer;
    final sessionPtr = session.pointer;
    await runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      view.session = ffi.AVCaptureSession.castFromPointer(sessionPtr);
    });
  }

  Future<void> setVideoGravityOnMainThread(
      ffi.DartAVLayerVideoGravity videoGravity) async {
    final viewPtr = pointer;
    final videoGravityPtr = videoGravity.pointer;
    await runOnPlatformThread(() {
      final view = ffi.PreviewView.castFromPointer(viewPtr);
      view.videoGravity =
          ffi.DartAVLayerVideoGravity.castFromPointer(videoGravityPtr);
    });
  }
}
