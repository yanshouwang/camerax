import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class OutputResultsImpl implements OutputResults {
  final OutputResultsProxyApi api;

  OutputResultsImpl.internal(this.api);

  @override
  Uri? get outputUri => api.outputUri?.uriImpl;
}

extension OutputResultsProxyApiX on OutputResultsProxyApi {
  OutputResults get impl => OutputResultsImpl.internal(this);
}
