abstract base class AutoCloseable {
  AutoCloseable.impl();

  Future<void> close();
}
