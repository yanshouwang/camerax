abstract base class Recording {
  Recording.impl();

  Future<void> mute(bool muted);
  Future<void> pause();
  Future<void> resume();
  Future<void> stop();
  Future<void> close();
}
