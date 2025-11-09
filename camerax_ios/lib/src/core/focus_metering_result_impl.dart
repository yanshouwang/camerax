import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FocusMeteringResultImpl extends FocusMeteringResult {
  final FocusMeteringResultProxyApi api;

  FocusMeteringResultImpl.internal(this.api) : super.impl();

  @override
  bool get isFocusSuccessful => api.isFocusSuccessful;
}

extension FocusMeteringResultProxyApiX on FocusMeteringResultProxyApi {
  FocusMeteringResult get impl => FocusMeteringResultImpl.internal(this);
}
