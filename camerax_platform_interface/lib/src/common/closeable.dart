import 'auto_closeable.dart';

abstract base class Closeable extends AutoCloseable {
  Closeable.impl() : super.impl();
}
