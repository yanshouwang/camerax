import 'package:camerax_platform_interface/src/camerax_plugin.dart';

abstract base class OutputResultsApi {
  OutputResultsApi.impl();

  factory OutputResultsApi() => CameraXPlugin.instance.$OutputResultsApi();

  Uri? get outputUri;
}
