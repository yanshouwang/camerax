package dev.hebei.camerax_android.core

import androidx.camera.core.DynamicRange
import dev.hebei.camerax_android.BitDepthApi
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.EncodingApi
import dev.hebei.camerax_android.PigeonApiDynamicRangeApi

class DynamicRangeImpl(impl: CameraXImpl) : PigeonApiDynamicRangeApi(impl) {
    override fun pigeon_defaultConstructor(encoding: EncodingApi, bitDepth: BitDepthApi): DynamicRange {
        return DynamicRange(encoding.impl, bitDepth.impl)
    }

    override fun encoding(pigeon_instance: DynamicRange): EncodingApi {
        return pigeon_instance.encoding.encodingApi
    }

    override fun bitDepth(pigeon_instance: DynamicRange): BitDepthApi {
        return pigeon_instance.bitDepth.bitDepthApi
    }
}

val EncodingApi.impl
    get() = when (this) {
        EncodingApi.UNSPECIFIED -> DynamicRange.ENCODING_UNSPECIFIED
        EncodingApi.SDR -> DynamicRange.ENCODING_SDR
        EncodingApi.HDR_UNSPECIFIED -> DynamicRange.ENCODING_HDR_UNSPECIFIED
        EncodingApi.HLG -> DynamicRange.ENCODING_HLG
        EncodingApi.HDR10 -> DynamicRange.ENCODING_HDR10
        EncodingApi.HDR10PLUS -> DynamicRange.ENCODING_HDR10_PLUS
        EncodingApi.DOLBY_VISION -> DynamicRange.ENCODING_DOLBY_VISION
    }

val BitDepthApi.impl
    get() = when (this) {
        BitDepthApi.BIT_DEPTH_UNSPECIFIED -> DynamicRange.BIT_DEPTH_UNSPECIFIED
        BitDepthApi.BIT_DEPTH8BIT -> DynamicRange.BIT_DEPTH_8_BIT
        BitDepthApi.BIT_DEPTH10BIT -> DynamicRange.BIT_DEPTH_10_BIT
    }

val Int.encodingApi
    get() = when (this) {
        DynamicRange.ENCODING_UNSPECIFIED -> EncodingApi.UNSPECIFIED
        DynamicRange.ENCODING_SDR -> EncodingApi.SDR
        DynamicRange.ENCODING_HDR_UNSPECIFIED -> EncodingApi.HDR_UNSPECIFIED
        DynamicRange.ENCODING_HLG -> EncodingApi.HLG
        DynamicRange.ENCODING_HDR10 -> EncodingApi.HDR10
        DynamicRange.ENCODING_HDR10_PLUS -> EncodingApi.HDR10PLUS
        DynamicRange.ENCODING_DOLBY_VISION -> EncodingApi.DOLBY_VISION
        else -> throw IllegalArgumentException()
    }

val Int.bitDepthApi
    get() = when (this) {
        DynamicRange.BIT_DEPTH_UNSPECIFIED -> BitDepthApi.BIT_DEPTH_UNSPECIFIED
        DynamicRange.BIT_DEPTH_8_BIT -> BitDepthApi.BIT_DEPTH8BIT
        DynamicRange.BIT_DEPTH_10_BIT -> BitDepthApi.BIT_DEPTH10BIT
        else -> throw IllegalArgumentException()
    }