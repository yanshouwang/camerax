class VideoRecordError extends Error {
  final Object? message;

  VideoRecordError([this.message]);

  @override
  String toString() {
    if (message != null) {
      return "VideoRecordError: ${Error.safeToString(message)}";
    }
    return "VideoRecordError";
  }
}
