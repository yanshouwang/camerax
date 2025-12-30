import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'camera_controller_impl.dart';

final class TapToFocusInfoImpl extends TapToFocusInfo {
  final TapToFocusInfoProxyApi api;

  TapToFocusInfoImpl.internal(this.api) : super.impl();

  @override
  CameraController$TapToFocus get focusState => api.focusState.impl;

  @override
  Point<double>? get tapPoint => api.tapPoint?.impl;
}

extension TapToFocusInfoProxyApiX on TapToFocusInfoProxyApi {
  TapToFocusInfo get impl => TapToFocusInfoImpl.internal(this);
}
