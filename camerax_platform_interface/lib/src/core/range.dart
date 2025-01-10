import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Immutable class for describing the range of two numeric values.
///
/// A range (or "interval") defines the inclusive boundaries around a contiguous
/// span of values of some Comparable type; for example, "integers from 1 to 100
/// inclusive."
///
/// All ranges are bounded, and the left side of the range is always <= the right
/// side of the range.
///
/// Although the implementation itself is immutable, there is no restriction that
/// objects stored must also be immutable. If mutable objects are stored here,
/// then the range effectively becomes mutable.
abstract base class Range<T> extends PlatformInterface {
  static final _token = Object();

  Range.impl() : super(token: _token);

  /// Get the lower endpoint.
  Future<T> getLower();

  /// Get the upper endpoint.
  Future<T> getUpper();
}
