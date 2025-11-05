import 'package:camerax_android/src/camerax_api.g.dart';
import 'package:camerax_android/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class OutputResultsImpl extends OutputResultsApi {
  final OutputResultsProxyApi api;

  OutputResultsImpl.internal(this.api) : super.impl();

  @override
  Uri? get outputUri => api.outputUri?.uriImpl;
}

extension OutputResultsProxyApiX on OutputResultsProxyApi {
  OutputResultsApi get impl => OutputResultsImpl.internal(this);
}
