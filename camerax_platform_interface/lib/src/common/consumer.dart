import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract interface class Consumer<T> {
  factory Consumer({required void Function(T value) accept}) =>
      ConsumerChannel.instance.create(accept: accept);
}

abstract base class ConsumerChannel extends PlatformInterface {
  ConsumerChannel() : super(token: _token);

  static final _token = Object();

  static ConsumerChannel? _instance;

  static ConsumerChannel get instance =>
      ArgumentError.checkNotNull(_instance, 'instance');

  static set instance(ConsumerChannel instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  Consumer<T> create<T>({required void Function(T value) accept});
}
