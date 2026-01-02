import 'package:camerax_android/src/api.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class FocusMeteringResultImpl implements FocusMeteringResult {
  final FocusMeteringResultProxyApi api;

  FocusMeteringResultImpl.internal(this.api);

  @override
  bool get isFocusSuccessful => api.isFocusSuccessful;
}

extension FocusMeteringResultProxyApiX on FocusMeteringResultProxyApi {
  FocusMeteringResult get impl => FocusMeteringResultImpl.internal(this);
}
