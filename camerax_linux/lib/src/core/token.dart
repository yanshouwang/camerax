class Token {
  bool _isCancelled;

  Token() : _isCancelled = false;

  bool get isCancelled => _isCancelled;
  bool get isNotCancelled => !_isCancelled;

  void cancel() {
    if (isCancelled) {
      return;
    }
    _isCancelled = true;
  }
}
