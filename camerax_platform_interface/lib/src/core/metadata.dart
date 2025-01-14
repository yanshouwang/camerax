import 'package:camerax_platform_interface/src/common.dart';

final class Metadata {
  final Location? location;
  final bool isReversedHorizontal;
  final bool isReversedVertical;

  const Metadata({
    this.location,
    this.isReversedHorizontal = false,
    this.isReversedVertical = false,
  });
}
