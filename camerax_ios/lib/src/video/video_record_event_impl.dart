import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

// import 'output_options_impl.dart';
import 'output_results_impl.dart';
import 'recording_stats_impl.dart';

base mixin VideoRecordEventImpl on VideoRecordEvent {
  VideoRecordEventProxyApi get api;
}

final class VideoRecordStatusEventImpl extends VideoRecordStatusEvent
    with VideoRecordEventImpl {
  @override
  final VideoRecordStatusEventProxyApi api;

  VideoRecordStatusEventImpl.internal(this.api) : super.impl();

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  // api.outputOptions.impl;
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordStartEventImpl extends VideoRecordStartEvent
    with VideoRecordEventImpl {
  @override
  final VideoRecordStartEventProxyApi api;

  VideoRecordStartEventImpl.internal(this.api) : super.impl();

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  // api.outputOptions.impl;
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordPauseEventImpl extends VideoRecordPauseEvent
    with VideoRecordEventImpl {
  @override
  final VideoRecordPauseEventProxyApi api;

  VideoRecordPauseEventImpl.internal(this.api) : super.impl();

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  // api.outputOptions.impl;
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordResumeEventImpl extends VideoRecordResumeEvent
    with VideoRecordEventImpl {
  @override
  final VideoRecordResumeEventProxyApi api;

  VideoRecordResumeEventImpl.internal(this.api) : super.impl();

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  // api.outputOptions.impl;
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
}

final class VideoRecordFinalizeEventImpl extends VideoRecordFinalizeEvent
    with VideoRecordEventImpl {
  @override
  final VideoRecordFinalizeEventProxyApi api;

  VideoRecordFinalizeEventImpl.internal(this.api) : super.impl();

  @override
  OutputOptions get outputOptions => throw UnimplementedError();
  // api.outputOptions.impl;
  @override
  RecordingStats get recordingStats => api.recordingStats.impl;
  @override
  Object? get cause => api.cause?.impl;
  @override
  VideoRecordFinalizeEvent$Error get error => api.error.impl;
  @override
  bool get hasError => api.hasError;
  @override
  OutputResults get outputResults => api.outputResults.impl;
}

extension VideoRecordFinalizeEventErrorApiX
    on VideoRecordFinalizeEventErrorApi {
  VideoRecordFinalizeEvent$Error get impl =>
      VideoRecordFinalizeEvent$Error.values[index];
}

extension VideoRecordEventProxyApiX on VideoRecordEventProxyApi {
  VideoRecordEvent get impl {
    final api = this;
    if (api is VideoRecordStatusEventProxyApi) {
      return VideoRecordStatusEventImpl.internal(api);
    } else if (api is VideoRecordStartEventProxyApi) {
      return VideoRecordStartEventImpl.internal(api);
    } else if (api is VideoRecordPauseEventProxyApi) {
      return VideoRecordPauseEventImpl.internal(api);
    } else if (api is VideoRecordResumeEventProxyApi) {
      return VideoRecordResumeEventImpl.internal(api);
    } else if (api is VideoRecordFinalizeEventProxyApi) {
      return VideoRecordFinalizeEventImpl.internal(api);
    } else {
      throw TypeError();
    }
  }
}
