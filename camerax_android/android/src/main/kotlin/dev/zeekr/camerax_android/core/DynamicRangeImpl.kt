package dev.zeekr.camerax_android.core

import androidx.camera.core.DynamicRange
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.DynamicRangeBitDepthApi
import dev.zeekr.camerax_android.DynamicRangeEncodingApi
import dev.zeekr.camerax_android.PigeonApiDynamicRangeApi

class DynamicRangeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiDynamicRangeApi(registrar) {
    override fun pigeon_defaultConstructor(
        encoding: DynamicRangeEncodingApi,
        bitDepth: DynamicRangeBitDepthApi
    ): DynamicRange {
        return DynamicRange(encoding.impl, bitDepth.impl)
    }

    override fun encoding(pigeon_instance: DynamicRange): DynamicRangeEncodingApi {
        return pigeon_instance.encoding.dynamicRangeEncodingApi
    }

    override fun bitDepth(pigeon_instance: DynamicRange): DynamicRangeBitDepthApi {
        return pigeon_instance.bitDepth.dynamicRangeBitDepthApi
    }
}

val DynamicRangeEncodingApi.impl: Int
    get() = when (this) {
        DynamicRangeEncodingApi.UNSPECIFIED -> DynamicRange.ENCODING_UNSPECIFIED
        DynamicRangeEncodingApi.SDR -> DynamicRange.ENCODING_SDR
        DynamicRangeEncodingApi.HDR_UNSPECIFIED -> DynamicRange.ENCODING_HDR_UNSPECIFIED
        DynamicRangeEncodingApi.HLG -> DynamicRange.ENCODING_HLG
        DynamicRangeEncodingApi.HDR10 -> DynamicRange.ENCODING_HDR10
        DynamicRangeEncodingApi.HDR10PLUS -> DynamicRange.ENCODING_HDR10_PLUS
        DynamicRangeEncodingApi.DOLBY_VISION -> DynamicRange.ENCODING_DOLBY_VISION
    }

val DynamicRangeBitDepthApi.impl: Int
    get() = when (this) {
        DynamicRangeBitDepthApi.UNSPECIFIED -> DynamicRange.BIT_DEPTH_UNSPECIFIED
        DynamicRangeBitDepthApi.EIGHT_BIT -> DynamicRange.BIT_DEPTH_8_BIT
        DynamicRangeBitDepthApi.TEN_BIT -> DynamicRange.BIT_DEPTH_10_BIT
    }

val Int.dynamicRangeEncodingApi: DynamicRangeEncodingApi
    get() = when (this) {
        DynamicRange.ENCODING_UNSPECIFIED -> DynamicRangeEncodingApi.UNSPECIFIED
        DynamicRange.ENCODING_SDR -> DynamicRangeEncodingApi.SDR
        DynamicRange.ENCODING_HDR_UNSPECIFIED -> DynamicRangeEncodingApi.HDR_UNSPECIFIED
        DynamicRange.ENCODING_HLG -> DynamicRangeEncodingApi.HLG
        DynamicRange.ENCODING_HDR10 -> DynamicRangeEncodingApi.HDR10
        DynamicRange.ENCODING_HDR10_PLUS -> DynamicRangeEncodingApi.HDR10PLUS
        DynamicRange.ENCODING_DOLBY_VISION -> DynamicRangeEncodingApi.DOLBY_VISION
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val Int.dynamicRangeBitDepthApi: DynamicRangeBitDepthApi
    get() = when (this) {
        DynamicRange.BIT_DEPTH_UNSPECIFIED -> DynamicRangeBitDepthApi.UNSPECIFIED
        DynamicRange.BIT_DEPTH_8_BIT -> DynamicRangeBitDepthApi.EIGHT_BIT
        DynamicRange.BIT_DEPTH_10_BIT -> DynamicRangeBitDepthApi.TEN_BIT
        else -> throw NotImplementedError("Not implemented value: $this")
    }