package dev.zeekr.camerax_android.core

import androidx.camera.core.DynamicRange
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.DynamicRangeBitDepthApi
import dev.zeekr.camerax_android.DynamicRangeEncodingApi
import dev.zeekr.camerax_android.PigeonApiDynamicRangeProxyApi
import dev.zeekr.camerax_android.PigeonApiDynamicRangeUtilProxyApi

class DynamicRangeImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiDynamicRangeProxyApi(registrar) {
    class UtilImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiDynamicRangeUtilProxyApi(registrar) {
        override fun fromEncoding(value: Long): DynamicRangeEncodingApi {
            return Util.fromEncoding(value.toInt())
        }

        override fun fromBitDepth(value: Long): DynamicRangeBitDepthApi {
            return Util.fromBitDepth(value.toInt())
        }

        override fun toEncoding(api: DynamicRangeEncodingApi): Long {
            return Util.toEncoding(api).toLong()
        }

        override fun toBitDepth(api: DynamicRangeBitDepthApi): Long {
            return Util.toBitDepth(api).toLong()
        }
    }

    object Util {
        fun fromEncoding(value: Int): DynamicRangeEncodingApi {
            return when (value) {
                DynamicRange.ENCODING_UNSPECIFIED -> DynamicRangeEncodingApi.UNSPECIFIED
                DynamicRange.ENCODING_SDR -> DynamicRangeEncodingApi.SDR
                DynamicRange.ENCODING_HDR_UNSPECIFIED -> DynamicRangeEncodingApi.HDR_UNSPECIFIED
                DynamicRange.ENCODING_HLG -> DynamicRangeEncodingApi.HLG
                DynamicRange.ENCODING_HDR10 -> DynamicRangeEncodingApi.HDR10
                DynamicRange.ENCODING_HDR10_PLUS -> DynamicRangeEncodingApi.HDR10PLUS
                DynamicRange.ENCODING_DOLBY_VISION -> DynamicRangeEncodingApi.DOLBY_VISION
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun fromBitDepth(value: Int): DynamicRangeBitDepthApi {
            return when (value) {
                DynamicRange.BIT_DEPTH_UNSPECIFIED -> DynamicRangeBitDepthApi.UNSPECIFIED
                DynamicRange.BIT_DEPTH_8_BIT -> DynamicRangeBitDepthApi.EIGHT_BIT
                DynamicRange.BIT_DEPTH_10_BIT -> DynamicRangeBitDepthApi.TEN_BIT
                else -> throw NotImplementedError("Not implemented value: $this")
            }
        }

        fun toEncoding(api: DynamicRangeEncodingApi): Int {
            return when (api) {
                DynamicRangeEncodingApi.UNSPECIFIED -> DynamicRange.ENCODING_UNSPECIFIED
                DynamicRangeEncodingApi.SDR -> DynamicRange.ENCODING_SDR
                DynamicRangeEncodingApi.HDR_UNSPECIFIED -> DynamicRange.ENCODING_HDR_UNSPECIFIED
                DynamicRangeEncodingApi.HLG -> DynamicRange.ENCODING_HLG
                DynamicRangeEncodingApi.HDR10 -> DynamicRange.ENCODING_HDR10
                DynamicRangeEncodingApi.HDR10PLUS -> DynamicRange.ENCODING_HDR10_PLUS
                DynamicRangeEncodingApi.DOLBY_VISION -> DynamicRange.ENCODING_DOLBY_VISION
            }
        }

        fun toBitDepth(api: DynamicRangeBitDepthApi): Int {
            return when (api) {
                DynamicRangeBitDepthApi.UNSPECIFIED -> DynamicRange.BIT_DEPTH_UNSPECIFIED
                DynamicRangeBitDepthApi.EIGHT_BIT -> DynamicRange.BIT_DEPTH_8_BIT
                DynamicRangeBitDepthApi.TEN_BIT -> DynamicRange.BIT_DEPTH_10_BIT
            }
        }
    }

    override fun pigeon_defaultConstructor(encoding: Long, bitDepth: Long): DynamicRange {
        return DynamicRange(encoding.toInt(), bitDepth.toInt())
    }

    override fun unspecifid(): DynamicRange {
        return DynamicRange.UNSPECIFIED
    }

    override fun sdr(): DynamicRange {
        return DynamicRange.SDR
    }

    override fun hdrUnspecified10Bit(): DynamicRange {
        return DynamicRange.HDR_UNSPECIFIED_10_BIT
    }

    override fun hdr10_10Bit(): DynamicRange {
        return DynamicRange.HDR10_10_BIT
    }

    override fun hdr10Plus10Bit(): DynamicRange {
        return DynamicRange.HDR10_PLUS_10_BIT
    }

    override fun hlg10Bit(): DynamicRange {
        return DynamicRange.HLG_10_BIT
    }

    override fun dolbyVision8Bit(): DynamicRange {
        return DynamicRange.DOLBY_VISION_8_BIT
    }

    override fun dolbyVision10Bit(): DynamicRange {
        return DynamicRange.DOLBY_VISION_10_BIT
    }

    override fun getBitDepth(pigeon_instance: DynamicRange): Long {
        return pigeon_instance.bitDepth.toLong()
    }

    override fun getEncoding(pigeon_instance: DynamicRange): Long {
        return pigeon_instance.encoding.toLong()
    }
}
