import 'dart:async';
import 'dart:collection';

abstract class FutureSynchronizer {
  Future<T> sync<T>(Future<T> Function() future);

  factory FutureSynchronizer() => _FutureSynchronizer();
}

class _FutureSynchronizer implements FutureSynchronizer {
  final futures = Queue<Future<void> Function()>();
  var idle = true;

  @override
  Future<T> sync<T>(Future<T> Function() future) {
    final completer = Completer<T>();
    futures.add(() async {
      try {
        final value = await future();
        completer.complete(value);
      } catch (e) {
        completer.completeError(e);
      }
    });
    execute();
    return completer.future;
  }

  void execute() async {
    if (idle) {
      idle = false;
      while (futures.isNotEmpty) {
        final method = futures.removeFirst();
        await method.call();
      }
      idle = true;
    }
  }
}
