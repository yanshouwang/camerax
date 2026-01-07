import 'package:camerax_android/src/api.dart';
import 'package:camerax_android/src/core.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

final class SurfaceOrientedMeteringPointFactoryImpl
    extends MeteringPointFactoryImpl
    implements SurfaceOrientedMeteringPointFactory {
  @override
  final SurfaceOrientedMeteringPointFactoryProxyApi api;

  SurfaceOrientedMeteringPointFactoryImpl.internal(this.api);
}

final class SurfaceOrientedMeteringPointFactoryChannelImpl
    extends SurfaceOrientedMeteringPointFactoryChannel {
  @override
  SurfaceOrientedMeteringPointFactory create(double width, double height) {
    final api = SurfaceOrientedMeteringPointFactoryProxyApi(
      width: width,
      height: height,
    );
    return SurfaceOrientedMeteringPointFactoryImpl.internal(api);
  }
}
