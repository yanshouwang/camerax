abstract base class Consumer<T> {
  Consumer.impl();

  factory Consumer({required void Function(T value) accept}) {
    switch (T) {
      case const (VideoRecordEvent):
        return VideoRecordEventConsumerImpl(accept: (e) => accept(e as T))
            as Consumer<T>;
      case const (MlKitAnalyzerResult):
        return MlKitAnalyzerResultConsumerImpl(accept: (e) => accept(e as T))
            as Consumer<T>;
      case const (AVAnalyzerResult):
        return AVAnalyzerResultConsumerImpl(accept: (e) => accept(e as T))
            as Consumer<T>;
      default:
        return ConsumerImpl(accept: accept);
    }
  }
}

final class VideoRecordEventConsumerImpl extends Consumer<VideoRecordEvent> {}

final class VisionAnalyzerResultConsumerImpl
    extends Consumer<VisionAnalyzerResult> {}

final class ConsumerImpl<T> extends Consumer<T> {
  final void Function(T value) accept;

  ConsumerImpl({required this.accept}) : super.impl();
}

extension ConsumerX<T> on Consumer<T> {
  void accept(T value) {
    final impl = this;
    if (impl is! ConsumerImpl<T>) throw TypeError();
    impl.accept(value);
  }
}
