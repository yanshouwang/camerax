import 'package:camerax_platform_interface/src/common.dart';

abstract interface class LiveData<T> {
  Future<T?> getValue();
  // Future<bool> hasActivieObservers();
  // Future<bool> hasObservers();
  // Future<bool> isInitialized();
  // Future<void> observe(LifecycleOwner owner, Observer<T> observer);
  Future<void> observeForever(Observer<T> observer);
  Future<void> removeObserver(Observer<T> observer);
  // Future<void> removeObservers(LifecycleOwner owner);
}
