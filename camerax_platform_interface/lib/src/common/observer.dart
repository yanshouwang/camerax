import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Observer<T> {
  factory Observer({required void Function(T value) onChanged}) =>
      ObserverChannel.instance.create(onChanged: onChanged);
}

abstract base class ObserverChannel extends PlatformInterface {
  ObserverChannel() : super(token: _token);

  static final _token = Object();

  static ObserverChannel? _instance;

  static ObserverChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ObserverChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Observer<T> create<T>({required void Function(T value) onChanged});
}
