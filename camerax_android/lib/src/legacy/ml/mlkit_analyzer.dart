import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;
import 'package:camerax_platform_interface/camerax_platform_interface.dart'
    as $base;

final class MlKitAnalyzer extends $base.MlKitAnalyzer {
  final $native.MlKitAnalyzer obj;

  MlKitAnalyzer.$native(this.obj) : super.impl();

  // factory MlKitAnalyzer({
  //   required List<$base.MLObjectType> types,
  //   required $base.CoordinateSystem targetCoordinateSystem,
  //   required $base.MLObjectsCallback onAnalyzed,
  // }) {
  //   final obj = $native.MlKitAnalyzer(
  //     detectors: detectors,
  //     targetCoordinateSystem: targetCoordinateSystem,
  //     consumer: $native.MlKitAnalyzerResultConsumer(
  //       accept: (obj, value) {
  //         onAnalyzed(items);
  //       },
  //     ),
  //   );
  //   return MlKitAnalyzer.$native(obj);
  // }

  @override
  void analyze($base.ImageProxy image) {
    // TODO: implement analyze
  }
}
