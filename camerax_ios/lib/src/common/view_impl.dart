import 'package:camerax_platform_interface/camerax_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart' hide View;

base mixin ViewImpl on View {
  String get viewType;
  int? get identifier;

  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: identifier,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}
