import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_android/src/view.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class TapToFocusInfoImpl implements TapToFocusInfo {
  final TapToFocusInfoProxyApi api;

  TapToFocusInfoImpl.internal(this.api);

  @override
  CameraController$TapToFocus get focusState => api.focusState.impl;

  @override
  Point<double>? get tapPoint => api.tapPoint?.impl;
}

extension TapToFocusInfoProxyApiX on TapToFocusInfoProxyApi {
  TapToFocusInfo get impl => TapToFocusInfoImpl.internal(this);
}
