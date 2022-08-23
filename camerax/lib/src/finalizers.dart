import 'package:camerax_core/camerax_core.dart' as core;

final finalizer = Finalizer<String>((id) {
  core.FinalizerPigeon.instance.finalize(id);
});
