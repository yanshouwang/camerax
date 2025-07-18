import 'package:camerax_ios/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'lens_facing_impl.dart';

final class CameraSelectorImpl extends CameraSelector {
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.internal(CameraSelectorApi.front);
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.internal(CameraSelectorApi.back);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.internal(CameraSelectorApi.external);

  final CameraSelectorApi api;

  CameraSelectorImpl.internal(this.api) : super.impl();

  factory CameraSelectorImpl({
    LensFacing? lensFacing,
  }) {
    final api = CameraSelectorApi(
      lensFacing: lensFacing?.api,
    );
    return CameraSelectorImpl.internal(api);
  }

  @override
  int get hashCode => api.hashCode;

  @override
  bool operator ==(Object other) =>
      other is CameraSelectorImpl && api == other.api;
}

extension CameraSelectorApiX on CameraSelectorApi {
  CameraSelector get impl => CameraSelectorImpl.internal(this);
}
