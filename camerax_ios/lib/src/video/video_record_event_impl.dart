import 'package:camerax_ios/src/api.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_ios/src/video.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

abstract base class VideoRecordEventImpl implements VideoRecordEvent {
  VideoRecordEventProxyApi get api;
}

final class VideoRecordEvent$StatusImpl extends VideoRecordEventImpl
    implements VideoRecordEvent$Status {
  @override
  final VideoRecordEventStatusProxyApi api;

  VideoRecordEvent$StatusImpl.internal(this.api);

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordEvent$StartImpl extends VideoRecordEventImpl
    implements VideoRecordEvent$Start {
  @override
  final VideoRecordEventStartProxyApi api;

  VideoRecordEvent$StartImpl.internal(this.api);

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordEvent$PauseImpl extends VideoRecordEventImpl
    implements VideoRecordEvent$Pause {
  @override
  final VideoRecordEventPauseProxyApi api;

  VideoRecordEvent$PauseImpl.internal(this.api);

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordEvent$ResumeImpl extends VideoRecordEventImpl
    implements VideoRecordEvent$Resume {
  @override
  final VideoRecordEventResumeProxyApi api;

  VideoRecordEvent$ResumeImpl.internal(this.api);

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordEvent$FinalizeImpl extends VideoRecordEventImpl
    implements VideoRecordEvent$Finalize {
  @override
  final VideoRecordEventFinalizeProxyApi api;

  VideoRecordEvent$FinalizeImpl.internal(this.api);

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
  @override
  Object? get cause => api.cause?.impl;
  @override
  VideoRecordEvent$Finalize$Error get error => api.error.impl;
  @override
  bool get hasError => api.hasError;
  @override
  OutputResults get outputResults => api.outputResults.impl;
}

extension VideoRecordEventFinalizeErrorApiX
    on VideoRecordEventFinalizeErrorApi {
  VideoRecordEvent$Finalize$Error get impl =>
      VideoRecordEvent$Finalize$Error.values[index];
}

extension VideoRecordEventProxyApiX on VideoRecordEventProxyApi {
  VideoRecordEvent get impl {
    final api = this;
    if (api is VideoRecordEventStatusProxyApi) {
      return VideoRecordEvent$StatusImpl.internal(api);
    }
    if (api is VideoRecordEventStartProxyApi) {
      return VideoRecordEvent$StartImpl.internal(api);
    }
    if (api is VideoRecordEventPauseProxyApi) {
      return VideoRecordEvent$PauseImpl.internal(api);
    }
    if (api is VideoRecordEventResumeProxyApi) {
      return VideoRecordEvent$ResumeImpl.internal(api);
    }
    if (api is VideoRecordEventFinalizeProxyApi) {
      return VideoRecordEvent$FinalizeImpl.internal(api);
    }
    throw TypeError();
  }
}
