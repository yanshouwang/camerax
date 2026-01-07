import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class ZoomSuggestionOptions$ZoomCallback {
  factory ZoomSuggestionOptions$ZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  }) => ZoomSuggestionOptionsChannel.instance.createZoomCallback(
    setZoom: setZoom,
  );
}

abstract interface class ZoomSuggestionOptions$Builder {
  factory ZoomSuggestionOptions$Builder(
    ZoomSuggestionOptions$ZoomCallback zoomCallback,
  ) => ZoomSuggestionOptionsChannel.instance.createBuilder(zoomCallback);

  Future<ZoomSuggestionOptions$Builder> setMaxSupportedZoomRatio(
    double maxSupportedZoomRatio,
  );
  Future<ZoomSuggestionOptions> build();
}

abstract interface class ZoomSuggestionOptions {}

abstract base class ZoomSuggestionOptionsChannel extends PlatformInterface {
  ZoomSuggestionOptionsChannel() : super(token: _token);

  static final _token = Object();

  static ZoomSuggestionOptionsChannel? _instance;

  static ZoomSuggestionOptionsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ZoomSuggestionOptionsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  ZoomSuggestionOptions$ZoomCallback createZoomCallback({
    required bool Function(double zoomRatio) setZoom,
  });

  ZoomSuggestionOptions$Builder createBuilder(
    ZoomSuggestionOptions$ZoomCallback zoomCallback,
  );
}
