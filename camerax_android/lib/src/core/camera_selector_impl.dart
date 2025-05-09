import 'package:camerax_android/src/camerax.g.dart';
import 'package:camerax_platform_interface/camerax_platform_interface.dart';

import 'lens_facing_impl.dart';

final class CameraSelectorImpl extends CameraSelectorChannel {
  static CameraSelectorImpl get front =>
      CameraSelectorImpl.impl(CameraSelectorApi.front);
  static CameraSelectorImpl get back =>
      CameraSelectorImpl.impl(CameraSelectorApi.back);
  static CameraSelectorImpl get external =>
      CameraSelectorImpl.impl(CameraSelectorApi.external);

  final CameraSelectorApi api;

  CameraSelectorImpl.impl(this.api) : super.impl();

  factory CameraSelectorImpl({
    LensFacing? lensFacing,
  }) {
    final api = CameraSelectorApi(
      lensFacing: lensFacing?.api,
    );
    return CameraSelectorImpl.impl(api);
  }

  @override
  int get hashCode => api.hashCode;

  @override
  bool operator ==(Object other) =>
      other is CameraSelectorImpl && api == other.api;
}

extension CameraSelectorApiX on CameraSelectorApi {
  CameraSelector get impl => CameraSelectorImpl.impl(this);
}
