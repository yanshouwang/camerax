import 'package:camerax_core/camerax_core.dart' as core;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CameraViewBuilder extends core.CameraViewBuilder {
  @override
  Widget build({required String id, required String viewType}) {
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: id,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
