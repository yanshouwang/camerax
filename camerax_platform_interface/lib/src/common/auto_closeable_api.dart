abstract base class AutoCloseableApi {
  AutoCloseableApi.impl();

  Future<void> close();
}
