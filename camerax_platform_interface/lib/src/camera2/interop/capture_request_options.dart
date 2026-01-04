import 'package:camerax_platform_interface/src/camera2.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class CaptureRequestOptions$Builder
    implements ExtendableBuilder<CaptureRequestOptions> {
  factory CaptureRequestOptions$Builder() =>
      CaptureRequestOptionsChannel.instance.createBuilder();

  Future<CaptureRequestOptions$Builder> clearCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
  );
  Future<CaptureRequestOptions$Builder> setCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
    ValueT value,
  );
}

abstract interface class CaptureRequestOptions {
  Future<ValueT?> getCaptureRequestOption<ValueT>(
    CaptureRequest$Key<ValueT> key,
  );
}

abstract base class CaptureRequestOptionsChannel extends PlatformInterface {
  CaptureRequestOptionsChannel() : super(token: _token);

  static final _token = Object();

  static CaptureRequestOptionsChannel? _instance;

  static CaptureRequestOptionsChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(CaptureRequestOptionsChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  CaptureRequestOptions$Builder createBuilder();
}
