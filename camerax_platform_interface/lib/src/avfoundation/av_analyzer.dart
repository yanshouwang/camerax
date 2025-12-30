import 'package:camerax_platform_interface/src/common.dart';
import 'package:camerax_platform_interface/src/core.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'av_metadata_object.dart';

abstract interface class AVAnalyzer$Result {
  List<AVMetadataObject> get objects;
}

abstract interface class AVAnalyzer implements ImageAnalysis$Analyzer {
  factory AVAnalyzer({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzer$Result> consumer,
  }) => AVAnalyzerChannel.instance.create(types: types, consumer: consumer);
}

abstract base class AVAnalyzerChannel extends PlatformInterface {
  AVAnalyzerChannel() : super(token: _token);

  static final _token = Object();

  static AVAnalyzerChannel? _instance;

  static AVAnalyzerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(AVAnalyzerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  AVAnalyzer create({
    List<AVMetadataObjectType>? types,
    required Consumer<AVAnalyzer$Result> consumer,
  });
}
