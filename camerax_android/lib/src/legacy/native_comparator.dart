import 'package:camerax_android/src/legacy/camerax.g.dart' as $native;

mixin NativeComparator {
  $native.PigeonInternalProxyApiBaseClass get obj;

  @override
  int get hashCode => obj.hashCode;

  @override
  bool operator ==(Object other) =>
      other is NativeComparator && other.obj == obj;
}
