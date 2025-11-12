import 'package:camerax_ios/src/camerax_api.g.dart';
import 'package:camerax_ios/src/common.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class OutputResultsImpl extends OutputResults {
  final OutputResultsProxyApi api;

  OutputResultsImpl.internal(this.api) : super.impl();

  @override
  Uri? get outputUri => api.outputUri?.uriImpl;
}

extension OutputResultsProxyApiX on OutputResultsProxyApi {
  OutputResults get impl => OutputResultsImpl.internal(this);
}
