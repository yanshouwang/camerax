//Generated by the protocol buffer compiler. DO NOT EDIT!
// source: messages.proto

package dev.yanshouwang.camerax.messages;

@kotlin.jvm.JvmName("-initializecameraSelector")
inline fun cameraSelector(block: dev.yanshouwang.camerax.messages.CameraSelectorKt.Dsl.() -> kotlin.Unit): dev.yanshouwang.camerax.messages.CameraSelector =
  dev.yanshouwang.camerax.messages.CameraSelectorKt.Dsl._create(dev.yanshouwang.camerax.messages.CameraSelector.newBuilder()).apply { block() }._build()
object CameraSelectorKt {
  @kotlin.OptIn(com.google.protobuf.kotlin.OnlyForUseByGeneratedProtoCode::class)
  @com.google.protobuf.kotlin.ProtoDslMarker
  class Dsl private constructor(
    private val _builder: dev.yanshouwang.camerax.messages.CameraSelector.Builder
  ) {
    companion object {
      @kotlin.jvm.JvmSynthetic
      @kotlin.PublishedApi
      internal fun _create(builder: dev.yanshouwang.camerax.messages.CameraSelector.Builder): Dsl = Dsl(builder)
    }

    @kotlin.jvm.JvmSynthetic
    @kotlin.PublishedApi
    internal fun _build(): dev.yanshouwang.camerax.messages.CameraSelector = _builder.build()

    /**
     * <code>int32 facingNumber = 1;</code>
     */
    var facingNumber: kotlin.Int
      @JvmName("getFacingNumber")
      get() = _builder.getFacingNumber()
      @JvmName("setFacingNumber")
      set(value) {
        _builder.setFacingNumber(value)
      }
    /**
     * <code>int32 facingNumber = 1;</code>
     */
    fun clearFacingNumber() {
      _builder.clearFacingNumber()
    }
  }
}
@kotlin.jvm.JvmSynthetic
inline fun dev.yanshouwang.camerax.messages.CameraSelector.copy(block: dev.yanshouwang.camerax.messages.CameraSelectorKt.Dsl.() -> kotlin.Unit): dev.yanshouwang.camerax.messages.CameraSelector =
  dev.yanshouwang.camerax.messages.CameraSelectorKt.Dsl._create(this.toBuilder()).apply { block() }._build()

