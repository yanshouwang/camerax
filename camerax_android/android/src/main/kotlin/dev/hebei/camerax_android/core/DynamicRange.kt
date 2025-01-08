package dev.hebei.camerax_android.core

class DynamicRange {
    constructor(encoding: Encoding, bitDepth: BitDepth) {
        val obj = androidx.camera.core.DynamicRange(encoding.obj, bitDepth.obj)
        this.obj = obj
    }

    internal constructor(obj: androidx.camera.core.DynamicRange) {
        this.obj = obj
    }

    internal val obj: androidx.camera.core.DynamicRange

    val encoding get() = obj.encoding.encodingArgs
    val bitDepth get() = obj.bitDepth.bitDepthArgs

    enum class Encoding {
        UNSPECIFIED, SDR, HDR_UNSPECIFIED, HLG, HDR10, HDR10_PLUS, DOLBY_VISION,
    }

    enum class BitDepth {
        UNSPECIFIED, WITH_8_BIT, WITH_10_BIT,
    }
}

val DynamicRange.Encoding.obj
    get() = when (this) {
        DynamicRange.Encoding.UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED
        DynamicRange.Encoding.SDR -> androidx.camera.core.DynamicRange.ENCODING_SDR
        DynamicRange.Encoding.HDR_UNSPECIFIED -> androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED
        DynamicRange.Encoding.HLG -> androidx.camera.core.DynamicRange.ENCODING_HLG
        DynamicRange.Encoding.HDR10 -> androidx.camera.core.DynamicRange.ENCODING_HDR10
        DynamicRange.Encoding.HDR10_PLUS -> androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS
        DynamicRange.Encoding.DOLBY_VISION -> androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION
    }

val DynamicRange.BitDepth.obj
    get() = when (this) {
        DynamicRange.BitDepth.UNSPECIFIED -> androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED
        DynamicRange.BitDepth.WITH_8_BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT
        DynamicRange.BitDepth.WITH_10_BIT -> androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT
    }

val Int.encodingArgs
    get() = when (this) {
        androidx.camera.core.DynamicRange.ENCODING_UNSPECIFIED -> DynamicRange.Encoding.UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_SDR -> DynamicRange.Encoding.SDR
        androidx.camera.core.DynamicRange.ENCODING_HDR_UNSPECIFIED -> DynamicRange.Encoding.HDR_UNSPECIFIED
        androidx.camera.core.DynamicRange.ENCODING_HLG -> DynamicRange.Encoding.HLG
        androidx.camera.core.DynamicRange.ENCODING_HDR10 -> DynamicRange.Encoding.HDR10
        androidx.camera.core.DynamicRange.ENCODING_HDR10_PLUS -> DynamicRange.Encoding.HDR10_PLUS
        androidx.camera.core.DynamicRange.ENCODING_DOLBY_VISION -> DynamicRange.Encoding.DOLBY_VISION
        else -> throw IllegalArgumentException()
    }

val Int.bitDepthArgs
    get() = when (this) {
        androidx.camera.core.DynamicRange.BIT_DEPTH_UNSPECIFIED -> DynamicRange.BitDepth.UNSPECIFIED
        androidx.camera.core.DynamicRange.BIT_DEPTH_8_BIT -> DynamicRange.BitDepth.WITH_8_BIT
        androidx.camera.core.DynamicRange.BIT_DEPTH_10_BIT -> DynamicRange.BitDepth.WITH_10_BIT
        else -> throw IllegalArgumentException()
    }