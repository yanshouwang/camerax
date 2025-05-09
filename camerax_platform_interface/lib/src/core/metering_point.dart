import 'package:plugin_platform_interface/plugin_platform_interface.dart';

final _token = Object();

abstract interface class MeteringPoint {
  double get size;
}

abstract base class MeteringPointChannel extends PlatformInterface
    implements MeteringPoint {
  @override
  final double size;

  MeteringPointChannel.impl({
    required this.size,
  }) : super(token: _token);
}
