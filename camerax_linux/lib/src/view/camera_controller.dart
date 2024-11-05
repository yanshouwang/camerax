import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:isolate';

import 'package:camerax_linux/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:flutter/services.dart';
import 'package:hybrid_logging/hybrid_logging.dart';
import 'package:hybrid_v4l2/hybrid_v4l2.dart' as ffi;

class CameraControllerImpl
    with TypeLogger, LoggerController
    implements CameraController {
  final StreamController<ffi.V4L2TextureArgs> _textureChangedController;
  final StreamController<ZoomState?> _zoomStateChangedController;

  CameraSelector _selector;

  int? _fd;
  Token? _token;
  Analyzer? _analyzer;
  bool _analyzing;

  CameraControllerImpl()
      : _textureChangedController = StreamController.broadcast(),
        _zoomStateChangedController = StreamController.broadcast(),
        _selector = CameraSelector.external,
        _analyzing = false;

  Stream<ffi.V4L2TextureArgs> get textureChanged =>
      _textureChangedController.stream;

  @override
  Stream<ZoomState?> get zoomStateChanged => _zoomStateChangedController.stream;

  @override
  Future<bool> hasCamera(CameraSelector cameraSelector) async {
    if (cameraSelector.lensFacing != LensFacing.external) {
      return false;
    }
    return await File('/dev/video0').exists();
  }

  @override
  Future<CameraSelector> getCameraSelector() async {
    return _selector;
  }

  @override
  Future<void> setCameraSelector(CameraSelector cameraSelector) async {
    if (cameraSelector.lensFacing != LensFacing.external) {
      throw UnsupportedError('${cameraSelector.lensFacing} is unsupported.');
    }
    _selector = cameraSelector;
  }

  @override
  Future<void> bind() async {
    final fd0 = _fd;
    if (fd0 != null) {
      throw ArgumentError.value(fd0);
    }
    if (_selector.lensFacing != LensFacing.external) {
      throw ArgumentError.value(_selector);
    }
    final fd = await openAsync('/dev/video0');
    await beginStreamingAsync(fd);
    final token = Token();

    Future.doWhile(() async {
      final imageProxyArgs = await readAsync(fd);
      final timestamp = imageProxyArgs.$1;
      final format = imageProxyArgs.$2;
      final width = imageProxyArgs.$3;
      final height = imageProxyArgs.$4;
      final rotationDegrees = imageProxyArgs.$5;
      final planeProxies = imageProxyArgs.$6
          .map((planeProxyArgs) => PlaneProxyImpl(
                rowStride: planeProxyArgs.$1,
                pixelStride: planeProxyArgs.$2,
                value: planeProxyArgs.$3,
              ))
          .toList();
      // Preview.
      final textureArgs = ffi.V4L2TextureArgs(
        buffer: planeProxies[0].value,
        width: width,
        height: height,
      );
      _textureChangedController.add(textureArgs);
      // Analysis
      final analyzer = _analyzer;
      final analyzing = _analyzing;
      if (analyzer != null && !analyzing) {
        _analyzing = true;
        final imageProxy = ImageProxyImpl(
          timestamp: timestamp,
          format: format,
          width: width,
          height: height,
          rotationDegrees: rotationDegrees,
          planeProxies: planeProxies,
          onClosed: () => _analyzing = false,
        );
        analyzer.analyze(imageProxy);
      }
      return token.isNotCancelled;
    });

    _fd = fd;
    _token = token;

    final zoomState = await getZoomState();
    _zoomStateChangedController.add(zoomState);
  }

  @override
  Future<void> unbind() async {
    final fd = ArgumentError.checkNotNull(_fd);
    final token = ArgumentError.checkNotNull(_token);
    token.cancel();
    await endStreamingAsync(fd);
    await closeAsync(fd);
    _fd = null;
  }

  // TODO: How to convert focal length to zoom ratio.
  @override
  Future<ZoomState?> getZoomState() async {
    final fd = ArgumentError.checkNotNull(_fd);
    final (minimum, maximum) = await queryZoomAbsoluteAsync(fd);
    final value = await getZoomAbsoluteAsync(fd);
    return ZoomState(
      minZoomRatio: 1.0,
      maxZoomRatio: 3.0,
      zoomRatio: 1.0 + (value - minimum) / (maximum - minimum) * (3.0 - 1.0),
      linearZoom: (value - minimum) / (maximum - minimum),
    );
  }

  // TODO: How to convert zoom ratio to focal length.
  @override
  Future<void> setZoomRatio(double zoomRatio) async {
    final fd = ArgumentError.checkNotNull(_fd);
    final (minimum, maximum) = await queryZoomAbsoluteAsync(fd);
    final value =
        (minimum + (zoomRatio - 1.0) / (3.0 - 1.0) * (maximum - minimum))
            .toInt();
    await setZoomAbsoluteAsync(fd, value);

    final zoomState = await getZoomState();
    _zoomStateChangedController.add(zoomState);
  }

  @override
  Future<void> setLinearZoom(double linearZoom) async {
    final fd = ArgumentError.checkNotNull(_fd);
    final (minimum, maximum) = await queryZoomAbsoluteAsync(fd);
    final value = (minimum + linearZoom * (maximum - minimum)).toInt();
    await setZoomAbsoluteAsync(fd, value);
  }

  @override
  Future<ImageFormat> getImageAnalysisOutputImageFormat() async {
    return ImageFormat.rgba_8888;
  }

  @override
  Future<void> setImageAnalysisOutputImageFormat(
      ImageFormat outputImageFormat) async {
    if (outputImageFormat != ImageFormat.rgba_8888) {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> setImageAnalysisAnalyzer(Analyzer analyzer) async {
    _analyzer = analyzer;
  }

  @override
  Future<void> clearImageAnalysisAnalyzer() async {
    _analyzer = null;
  }

  @override
  Future<bool> checkAuthorization({required AuthorizationType type}) {
    // TODO: implement checkAuthorization
    throw UnimplementedError();
  }

  @override
  Future<void> enableTorch(bool enabled) {
    // TODO: implement enableTorch
    throw UnimplementedError();
  }

  @override
  Future<BackpressureStrategy> getImageAnalysisBackpressureStrategy() {
    // TODO: implement getImageAnalysisBackpressureStrategy
    throw UnimplementedError();
  }

  @override
  Future<int> getImageAnalysisImageQueueDepth() {
    // TODO: implement getImageAnalysisImageQueueDepth
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getImageAnalysisResolutionSelector() {
    // TODO: implement getImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<FlashMode> getImageCaptureFlashMode() {
    // TODO: implement getImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<CaptureMode> getImageCaptureMode() {
    // TODO: implement getImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getImageCaptureResolutionSelector() {
    // TODO: implement getImageCaptureResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<ResolutionSelector?> getPreviewResolutionSelector() {
    // TODO: implement getPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<bool?> getTorchState() {
    // TODO: implement getTorchState
    throw UnimplementedError();
  }

  @override
  Future<DynamicRange> getVideoCaptureDynamicRange() {
    // TODO: implement getVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<MirrorMode> getVideoCaptureMirrorMode() {
    // TODO: implement getVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<QualitySelector> getVideoCaptureQualitySelector() {
    // TODO: implement getVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<bool> isPinchToZoomEnabled() {
    // TODO: implement isPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<bool> isRecording() {
    // TODO: implement isRecording
    throw UnimplementedError();
  }

  @override
  Future<bool> isTapToFocusEnabled() async {
    return false;
  }

  @override
  Future<void> pauseRecording() {
    // TODO: implement pauseRecording
    throw UnimplementedError();
  }

  @override
  Future<bool> requestAuthorization({required AuthorizationType type}) {
    // TODO: implement requestAuthorization
    throw UnimplementedError();
  }

  @override
  Future<void> resumeRecording() {
    // TODO: implement resumeRecording
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisBackpressureStrategy(
      BackpressureStrategy backpressureStrategy) {
    // TODO: implement setImageAnalysisBackpressureStrategy
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisImageQueueDepth(int imageQueueDepth) {
    // TODO: implement setImageAnalysisImageQueueDepth
    throw UnimplementedError();
  }

  @override
  Future<void> setImageAnalysisResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setImageAnalysisResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureFlashMode(FlashMode flashMode) {
    // TODO: implement setImageCaptureFlashMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureMode(CaptureMode captureMode) {
    // TODO: implement setImageCaptureMode
    throw UnimplementedError();
  }

  @override
  Future<void> setImageCaptureResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setImageCaptureResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setPinchToZoomEnabled(bool enabled) {
    // TODO: implement setPinchToZoomEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setPreviewResolutionSelector(
      ResolutionSelector? resolutionSelector) {
    // TODO: implement setPreviewResolutionSelector
    throw UnimplementedError();
  }

  @override
  Future<void> setTapToFocusEnabled(bool enabled) {
    // TODO: implement setTapToFocusEnabled
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureDynamicRange(DynamicRange dynamicRange) {
    // TODO: implement setVideoCaptureDynamicRange
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureMirrorMode(MirrorMode mirrorMode) {
    // TODO: implement setVideoCaptureMirrorMode
    throw UnimplementedError();
  }

  @override
  Future<void> setVideoCaptureQualitySelector(QualitySelector qualitySelector) {
    // TODO: implement setVideoCaptureQualitySelector
    throw UnimplementedError();
  }

  @override
  Future<void> startRecording(
      {required Uri uri,
      required bool enableAudio,
      required VideoRecordEventCallback listener}) {
    // TODO: implement startRecording
    throw UnimplementedError();
  }

  @override
  Future<void> stopRecording() {
    // TODO: implement stopRecording
    throw UnimplementedError();
  }

  @override
  Future<Uri> takePicture({required Uri uri}) {
    // TODO: implement takePicture
    throw UnimplementedError();
  }

  @override
  // TODO: implement torchStateChanged
  Stream<bool?> get torchStateChanged => throw UnimplementedError();
}

typedef QueryZoomAbsoluteReplyArgs = (int minimum, int maximum);

typedef PlaneProxyArgs = (int rowStride, int pixelStride, Uint8List value);

typedef ReadReplyArgs = (
  int timestamp,
  ImageFormat format,
  int width,
  int height,
  int rotationDegrees,
  List<PlaneProxyArgs> planeProxies
);

Future<int> openAsync(String file) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<int>();
  _completers[id] = completer;
  final command = OpenCommand(id, file);
  sendPort.send(command);
  return completer.future;
}

Future<void> closeAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<void>();
  _completers[id] = completer;
  final command = CloseCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

Future<QueryZoomAbsoluteReplyArgs> queryZoomAbsoluteAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<QueryZoomAbsoluteReplyArgs>();
  _completers[id] = completer;
  final command = QueryZoomAbsoluteCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

Future<int> getZoomAbsoluteAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<int>();
  _completers[id] = completer;
  final command = GetZoomAbsoluteCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

Future<void> setZoomAbsoluteAsync(int fd, int value) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<void>();
  _completers[id] = completer;
  final command = SetZoomAbsoluteCommand(id, fd, value);
  sendPort.send(command);
  return completer.future;
}

Future<void> beginStreamingAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<void>();
  _completers[id] = completer;
  final command = BeginStreamingCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

Future<void> endStreamingAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<void>();
  _completers[id] = completer;
  final command = EndStreamingCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

Future<ReadReplyArgs> readAsync(int fd) async {
  final sendPort = await _sendPort;
  final id = _id++;
  final completer = Completer<ReadReplyArgs>();
  _completers[id] = completer;
  final command = ReadCommand(id, fd);
  sendPort.send(command);
  return completer.future;
}

abstract base class Command {
  final int id;

  const Command(this.id);
}

abstract base class Reply {
  final int id;
  final Object? error;

  const Reply(
    this.id,
    this.error,
  );
}

final class OpenCommand extends Command {
  final String file;

  const OpenCommand(super.id, this.file);
}

final class OpenReply extends Reply {
  final int? fd;

  const OpenReply(super.id, this.fd, super.error);
}

final class CloseCommand extends Command {
  final int fd;

  const CloseCommand(super.id, this.fd);
}

final class CloseReply extends Reply {
  const CloseReply(super.id, super.error);
}

final class QueryZoomAbsoluteCommand extends Command {
  final int fd;

  const QueryZoomAbsoluteCommand(super.id, this.fd);
}

final class QueryZoomAbsoluteReply extends Reply {
  final QueryZoomAbsoluteReplyArgs? args;

  const QueryZoomAbsoluteReply(
    super.id,
    this.args,
    super.error,
  );
}

final class GetZoomAbsoluteCommand extends Command {
  final int fd;

  const GetZoomAbsoluteCommand(super.id, this.fd);
}

final class GetZoomAbsoluteReply extends Reply {
  final int? value;

  const GetZoomAbsoluteReply(super.id, this.value, super.error);
}

final class SetZoomAbsoluteCommand extends Command {
  final int fd;
  final int value;

  SetZoomAbsoluteCommand(super.id, this.fd, this.value);
}

final class SetZoomAbsoluteReply extends Reply {
  SetZoomAbsoluteReply(super.id, super.error);
}

final class BeginStreamingCommand extends Command {
  final int fd;

  const BeginStreamingCommand(super.id, this.fd);
}

final class BeginStreamingReply extends Reply {
  const BeginStreamingReply(super.id, super.error);
}

final class EndStreamingCommand extends Command {
  final int fd;

  const EndStreamingCommand(super.id, this.fd);
}

final class EndStreamingReply extends Reply {
  const EndStreamingReply(super.id, super.error);
}

final class ReadCommand extends Command {
  final int fd;

  const ReadCommand(super.id, this.fd);
}

final class ReadReply extends Reply {
  final ReadReplyArgs? args;

  const ReadReply(
    super.id,
    this.args,
    super.error,
  );
}

var _id = 0;

final _completers = <int, Completer>{};

Future<SendPort> _sendPort = () async {
  final completer = Completer<SendPort>();
  final receivePort = ReceivePort()
    ..listen(
      (message) {
        if (message is SendPort) {
          completer.complete(message);
        } else if (message is OpenReply) {
          final id = message.id;
          final fd = message.fd;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete(fd);
          } else {
            completer.completeError(error);
          }
        } else if (message is CloseReply) {
          final id = message.id;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete();
          } else {
            completer.completeError(error);
          }
        } else if (message is QueryZoomAbsoluteReply) {
          final id = message.id;
          final args = message.args;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete(args);
          } else {
            completer.completeError(error);
          }
        } else if (message is GetZoomAbsoluteReply) {
          final id = message.id;
          final value = message.value;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete(value);
          } else {
            completer.completeError(error);
          }
        } else if (message is SetZoomAbsoluteReply) {
          final id = message.id;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete();
          } else {
            completer.completeError(error);
          }
        } else if (message is BeginStreamingReply) {
          final id = message.id;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete();
          } else {
            completer.completeError(error);
          }
        } else if (message is EndStreamingReply) {
          final id = message.id;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete();
          } else {
            completer.completeError(error);
          }
        } else if (message is ReadReply) {
          final id = message.id;
          final args = message.args;
          final error = message.error;
          final completer = _completers.remove(id);
          if (completer == null) {
            return;
          }
          if (error == null) {
            completer.complete(args);
          } else {
            completer.completeError(error);
          }
        } else {
          throw UnsupportedError(
              'Unsupported message type: ${message.runtimeType}');
        }
      },
    );
  await Isolate.spawn(
    (insideSendPort) {
      final bufPtrs = <ffi.Pointer<ffi.v4l2_buffer>>[];
      final mappedBufPtrs = <ffi.Pointer<ffi.v4l2_mapped_buffer>>[];
      final insideReceivePort = ReceivePort()
        ..listen(
          (message) async {
            if (message is OpenCommand) {
              final id = message.id;
              final file = message.file;
              try {
                final filePtr = file.toNativeUtf8().cast<ffi.Char>();
                final fd = ffi.libHybridV4L2.v4l2_open(
                  filePtr,
                  ffi.V4L2_O_RDWR | ffi.V4L2_O_NONBLOCK,
                );
                ffi.calloc.free(filePtr);
                if (fd == -1) {
                  throw PlatformException(
                    code: 'OPEN',
                    message: 'V4L2 OPEN `$file` failed, $fd.',
                  );
                }
                final reply = OpenReply(id, fd, null);
                insideSendPort.send(reply);
              } catch (e) {
                final reply = OpenReply(id, null, e);
                insideSendPort.send(reply);
              }
            } else if (message is CloseCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                final err = ffi.libHybridV4L2.v4l2_close(fd);
                if (err != 0) {
                  throw PlatformException(
                    code: 'CLOSE',
                    message: 'V4L2 CLOSE err: $err.',
                  );
                }
                final reply = CloseReply(id, null);
                insideSendPort.send(reply);
              } catch (e) {
                final reply = CloseReply(id, e);
                insideSendPort.send(reply);
              }
            } else if (message is QueryZoomAbsoluteCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                ffi.using((arena) {
                  final ctrlPtr = arena<ffi.v4l2_query_ext_ctrl>()
                    ..ref.id = ffi.V4L2_CID_ZOOM_ABSOLUTE;
                  final err =
                      ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_query_ext_ctrlPtr(
                    fd,
                    ffi.VIDIOC_QUERY_EXT_CTRL,
                    ctrlPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'QUERY_ZOOM_ABSOLUTE',
                      message: 'VIDIOC_QUERY_EXT_CTRL err: $err.',
                    );
                  }
                  final reply = QueryZoomAbsoluteReply(
                    id,
                    (ctrlPtr.ref.minimum, ctrlPtr.ref.maximum),
                    null,
                  );
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = QueryZoomAbsoluteReply(id, null, e);
                insideSendPort.send(reply);
              }
            } else if (message is GetZoomAbsoluteCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                ffi.using((arena) {
                  final controlsPtr = arena<ffi.v4l2_ext_control>()
                    ..ref.id = ffi.V4L2_CID_ZOOM_ABSOLUTE;
                  final ctrlsPtr = arena<ffi.v4l2_ext_controls>()
                    ..ref.unnamed.ctrl_class = ffi.V4L2_CTRL_CLASS_CAMERA
                    ..ref.unnamed.which = ffi.V4L2_CTRL_WHICH_CUR_VAL
                    ..ref.controls = controlsPtr
                    ..ref.count = 1;
                  final err =
                      ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_ext_controlsPtr(
                    fd,
                    ffi.VIDIOC_G_EXT_CTRLS,
                    ctrlsPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'GET_ZOOM_ABSOLUTE',
                      message: 'VIDIOC_G_EXT_CTRLS err: $err.',
                    );
                  }
                  final reply = GetZoomAbsoluteReply(
                    id,
                    controlsPtr.ref.unnamed.value,
                    null,
                  );
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = GetZoomAbsoluteReply(id, null, e);
                insideSendPort.send(reply);
              }
            } else if (message is SetZoomAbsoluteCommand) {
              final id = message.id;
              final fd = message.fd;
              final value = message.value;
              try {
                ffi.using((arena) {
                  final controlsPtr = arena<ffi.v4l2_ext_control>()
                    ..ref.id = ffi.V4L2_CID_ZOOM_ABSOLUTE
                    ..ref.unnamed.value = value;
                  final ctrlsPtr = arena<ffi.v4l2_ext_controls>()
                    ..ref.unnamed.ctrl_class = ffi.V4L2_CTRL_CLASS_CAMERA
                    ..ref.unnamed.which = ffi.V4L2_CTRL_WHICH_CUR_VAL
                    ..ref.controls = controlsPtr
                    ..ref.count = 1;
                  final err =
                      ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_ext_controlsPtr(
                    fd,
                    ffi.VIDIOC_S_EXT_CTRLS,
                    ctrlsPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'SET_ZOOM_ABSOLUTE',
                      message: 'VIDIOC_S_EXT_CTRLS err: $err.',
                    );
                  }
                  final reply = SetZoomAbsoluteReply(id, null);
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = SetZoomAbsoluteReply(id, e);
                insideSendPort.send(reply);
              }
            } else if (message is BeginStreamingCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                ffi.using((arena) {
                  // REQBUFS
                  final reqPtr = arena<ffi.v4l2_requestbuffers>()
                    ..ref.type = ffi.v4l2_buf_type.V4L2_BUF_TYPE_VIDEO_CAPTURE
                    ..ref.memory = ffi.v4l2_memory.V4L2_MEMORY_MMAP
                    ..ref.count = 4;
                  var err =
                      ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_requestbuffersPtr(
                    fd,
                    ffi.VIDIOC_REQBUFS,
                    reqPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'BIND',
                      message: 'V4L2 REQBUFS err: $err.',
                    );
                  }
                  for (var i = 0; i < reqPtr.ref.count; i++) {
                    // QUERYBUF
                    final bufPtr = ffi.calloc<ffi.v4l2_buffer>()
                      ..ref.type = ffi.v4l2_buf_type.V4L2_BUF_TYPE_VIDEO_CAPTURE
                      ..ref.memory = ffi.v4l2_memory.V4L2_MEMORY_MMAP
                      ..ref.index = i;
                    err = ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_bufferPtr(
                      fd,
                      ffi.VIDIOC_QUERYBUF,
                      bufPtr,
                    );
                    if (err != 0) {
                      throw PlatformException(
                        code: 'BIND',
                        message: 'V4L2 QUERYBUF err: $err.',
                      );
                    }
                    // MMAP
                    final mappedBufPtr = ffi.calloc<ffi.v4l2_mapped_buffer>();
                    err = ffi.libHybridV4L2.v4l2_mmap(
                      fd,
                      bufPtr.ref.m.offset,
                      bufPtr.ref.length,
                      ffi.V4L2_PROT_READ | ffi.V4L2_PROT_WRITE,
                      ffi.V4L2_MAP_SHARED,
                      mappedBufPtr,
                    );
                    if (err != 0) {
                      throw PlatformException(
                        code: 'BIND',
                        message: 'V4L2 MMAP err: $err.',
                      );
                    }
                    // QBUF
                    err = ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_bufferPtr(
                      fd,
                      ffi.VIDIOC_QBUF,
                      bufPtr,
                    );
                    if (err != 0) {
                      throw PlatformException(
                        code: 'BIND',
                        message: 'V4L2 QBUF err: $err.',
                      );
                    }
                    bufPtrs.add(bufPtr);
                    mappedBufPtrs.add(mappedBufPtr);
                  }
                  // STREAMON
                  final typePtr = arena<ffi.Int>()
                    ..value = ffi.v4l2_buf_type.V4L2_BUF_TYPE_VIDEO_CAPTURE;
                  err = ffi.libHybridV4L2.v4l2_ioctlIntPtr(
                    fd,
                    ffi.VIDIOC_STREAMON,
                    typePtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'BIND',
                      message: 'V4L2 STREAMON err: $err.',
                    );
                  }
                  final reply = BeginStreamingReply(id, null);
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = BeginStreamingReply(id, e);
                insideSendPort.send(reply);
              }
            } else if (message is EndStreamingCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                ffi.using((arena) {
                  // STREAMOFF
                  final typePtr = arena<ffi.Int>()
                    ..value = ffi.v4l2_buf_type.V4L2_BUF_TYPE_VIDEO_CAPTURE;
                  var err = ffi.libHybridV4L2.v4l2_ioctlIntPtr(
                    fd,
                    ffi.VIDIOC_STREAMOFF,
                    typePtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'UNBIND',
                      message: 'V4L2 STREAMOFF err: $err.',
                    );
                  }
                  for (var mappedBufPtr in mappedBufPtrs) {
                    // MUNMAP
                    err = ffi.libHybridV4L2.v4l2_munmap(mappedBufPtr);
                    if (err != 0) {
                      throw PlatformException(
                        code: 'UNBIND',
                        message: 'V4L2 MUNMAP err: $err.',
                      );
                    }
                    ffi.calloc.free(mappedBufPtr);
                  }
                  for (var bufPtr in bufPtrs) {
                    ffi.calloc.free(bufPtr);
                  }
                  mappedBufPtrs.clear();
                  bufPtrs.clear();
                  final reply = EndStreamingReply(id, null);
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = EndStreamingReply(id, e);
                insideSendPort.send(reply);
              }
            } else if (message is ReadCommand) {
              final id = message.id;
              final fd = message.fd;
              try {
                ffi.using((arena) {
                  // SELECT
                  final timeoutPtr = arena<ffi.timeval>()
                    ..ref.tv_sec = 2
                    ..ref.tv_usec = 0;
                  var err = ffi.libHybridV4L2.v4l2_select(fd, timeoutPtr);
                  if (err <= 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 SELECT err: $err.',
                    );
                  }
                  // DQBUF
                  final bufPtr = arena<ffi.v4l2_buffer>()
                    ..ref.type = ffi.v4l2_buf_type.V4L2_BUF_TYPE_VIDEO_CAPTURE
                    ..ref.memory = ffi.v4l2_memory.V4L2_MEMORY_MMAP;
                  err = ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_bufferPtr(
                    fd,
                    ffi.VIDIOC_DQBUF,
                    bufPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 DQBUF err: $err.',
                    );
                  }
                  final mappedBufPtr = mappedBufPtrs[bufPtr.ref.index];
                  // MJPGSize
                  final samplePtr = mappedBufPtr.ref.addr.cast<ffi.Uint8>();
                  final sampleSize = mappedBufPtr.ref.len;
                  final widthPtr = arena<ffi.Int>();
                  final heightPtr = arena<ffi.Int>();
                  err = ffi.libYUV.MJPGSize(
                    samplePtr,
                    sampleSize,
                    widthPtr,
                    heightPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 MJPGSize err: $err.',
                    );
                  }
                  // MJPGToARGB
                  final argbPtr =
                      arena<ffi.Uint8>(widthPtr.value * heightPtr.value * 4);
                  err = ffi.libYUV.MJPGToARGB(
                    samplePtr,
                    sampleSize,
                    argbPtr,
                    widthPtr.value * 4,
                    widthPtr.value,
                    heightPtr.value,
                    widthPtr.value,
                    heightPtr.value,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 MJPGToARGB err: $err.',
                    );
                  }
                  // ARGBToABGR
                  final abgrPtr =
                      arena<ffi.Uint8>(widthPtr.value * heightPtr.value * 4);
                  err = ffi.libYUV.ARGBToABGR(
                    argbPtr,
                    widthPtr.value * 4,
                    abgrPtr,
                    widthPtr.value * 4,
                    widthPtr.value,
                    heightPtr.value,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 ARGBToABGR err: $err.',
                    );
                  }
                  // QBUF
                  err = ffi.libHybridV4L2.v4l2_ioctlV4l2v4l2_bufferPtr(
                    fd,
                    ffi.VIDIOC_QBUF,
                    bufPtr,
                  );
                  if (err != 0) {
                    throw PlatformException(
                      code: 'READ',
                      message: 'V4L2 QBUF err: $err.',
                    );
                  }
                  final reply = ReadReply(
                    id,
                    (
                      bufPtr.ref.timestamp.tv_sec * 1000,
                      ImageFormat.rgba_8888,
                      widthPtr.value,
                      heightPtr.value,
                      0,
                      [
                        (
                          widthPtr.value * 4,
                          4,
                          abgrPtr
                              .asTypedList(widthPtr.value * heightPtr.value * 4)
                        ),
                      ]
                    ),
                    null,
                  );
                  insideSendPort.send(reply);
                });
              } catch (e) {
                final reply = ReadReply(id, null, e);
                insideSendPort.send(reply);
              }
            } else {
              throw UnsupportedError(
                  'Unsupported message type: ${message.runtimeType}');
            }
          },
        );
      insideSendPort.send(insideReceivePort.sendPort);
    },
    receivePort.sendPort,
  );
  return completer.future;
}();
