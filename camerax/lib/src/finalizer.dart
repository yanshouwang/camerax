import 'dart:async';

import 'package:camerax_core/camerax_core.dart' as core;

final finalizer = Finalizer<FinalizerArguments>(_finalize);

void _finalize(FinalizerArguments arguments) {
  core.FinalizerPigeon.instance.finalize(arguments.id);
  arguments.streamSubscription?.cancel();
}

abstract class FinalizerArguments {
  String get id;
  StreamSubscription? get streamSubscription;

  factory FinalizerArguments({
    required String id,
    StreamSubscription? streamSubscription,
  }) =>
      _FinalizerArguments(id, streamSubscription);
}

class _FinalizerArguments implements FinalizerArguments {
  @override
  final String id;
  @override
  final StreamSubscription? streamSubscription;

  _FinalizerArguments(this.id, this.streamSubscription);
}
