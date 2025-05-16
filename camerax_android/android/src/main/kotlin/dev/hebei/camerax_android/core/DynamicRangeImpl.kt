package dev.hebei.camerax_android.core

import dev.hebei.camerax_android.BitDepthApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.EncodingApi
import dev.hebei.camerax_android.PigeonApiDynamicRangeApi

class DynamicRangeImpl(impl: CameraXImpl) : PigeonApiDynamicRangeApi(impl) {
    override fun pigeon_defaultConstructor(
        encoding: EncodingApi, bitDepth: BitDepthApi
    ): androidx.camera.core.DynamicRange {
        return androidx.camera.core.DynamicRange(encoding.impl, bitDepth.impl)
    }

    override fun encoding(pigeon_instance: androidx.camera.core.DynamicRange): EncodingApi {
        return pigeon_instance.encoding.encodingApi
    }

    override fun bitDepth(pigeon_instance: androidx.camera.core.DynamicRange): BitDepthApi {
        return pigeon_instance.bitDepth.bitDepthApi
    }
}

val EncodingApi.impl
    get() = when (this) {
        EncodingApi.UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED
        EncodingApi.SDR -> androidx.camera.core.DynamicRange.ENCODING_SDR
        EncodingApi.HDR_UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED
        EncodingApi.HLG -> androidx.camera.core.DynamicRange.ENCODING_HLG
        EncodingApi.HDR10 -> androidx.camera.core.DynamicRange.ENCODING_HDR10
        EncodingApi.HDR10PLUS -> androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS
        EncodingApi.DOLBY_VISION -> androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION
    }

val BitDepthApi.impl
    get() = when (this) {
        BitDepthApi.BIT_DEPTH_UNSPECIFIED -> androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED
        BitDepthApi.BIT_DEPTH8BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT
        BitDepthApi.BIT_DEPTH10BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT
    }

val Int.encodingApi
    get() = when (this) {
        androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED -> EncodingApi.UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_SDR -> EncodingApi.SDR
        androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED -> EncodingApi.HDR_UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_HLG -> EncodingApi.HLG
        androidx.camera.core.DynamicRange.ENCODING_HDR10 -> EncodingApi.HDR10
        androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS -> EncodingApi.HDR10PLUS
        androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION -> EncodingApi.DOLBY_VISION
        else -> throw IllegalArgumentException()
    }

val Int.bitDepthApi
    get() = when (this) {
        androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED -> BitDepthApi.BIT_DEPTH_UNSPECIFIED
        androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT -> BitDepthApi.BIT_DEPTH8BIT
        androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT -> BitDepthApi.BIT_DEPTH10BIT
        else -> throw IllegalArgumentException()
    }