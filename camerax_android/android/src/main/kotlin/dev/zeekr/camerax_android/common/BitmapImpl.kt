package dev.zeekr.camerax_android.common

import android.graphics.Bitmap
import android.os.Build
import androidx.core.graphics.createBitmap
import androidx.core.graphics.get
import androidx.core.graphics.scale
import androidx.core.graphics.set
import dev.zeekr.camerax_android.BitmapCompressFormatApi
import dev.zeekr.camerax_android.BitmapConfigApi
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiBitmapProxyApi
import java.io.OutputStream
import java.nio.Buffer

class BitmapImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiBitmapProxyApi(registrar) {
    override fun createBitmap1(
        source: Bitmap,
        x: Long,
        y: Long,
        width: Long,
        height: Long
    ): Bitmap {
        return Bitmap.createBitmap(source, x.toInt(), y.toInt(), width.toInt(), height.toInt())
    }

    override fun createBitmap2(
        colors: List<Long>,
        width: Long,
        height: Long,
        config: BitmapConfigApi
    ): Bitmap {
        return Bitmap.createBitmap(colors.map { it.toInt() }.toIntArray(), width.toInt(), height.toInt(), config.impl)
    }

    override fun createBitmap5(src: Bitmap): Bitmap {
        return Bitmap.createBitmap(src)
    }

    override fun createBitmap10(
        colors: List<Long>,
        offset: Long,
        stride: Long,
        width: Long,
        height: Long,
        config: BitmapConfigApi
    ): Bitmap {
        return Bitmap.createBitmap(
            colors.map { it.toInt() }.toIntArray(),
            offset.toInt(),
            stride.toInt(),
            width.toInt(),
            height.toInt(),
            config.impl
        )
    }

    override fun createBitmap14(
        width: Long,
        height: Long,
        config: BitmapConfigApi
    ): Bitmap {
        return createBitmap(width.toInt(), height.toInt(), config.impl)
    }

    override fun createBitmap15(
        width: Long,
        height: Long,
        config: BitmapConfigApi,
        hasAlpha: Boolean
    ): Bitmap {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            Bitmap.createBitmap(width.toInt(), height.toInt(), config.impl, hasAlpha)
        } else {
            throw UnsupportedOperationException("Call requires API level 26")
        }
    }

    override fun createScaledBitmap(
        src: Bitmap,
        dstWidth: Long,
        dstHeight: Long,
        filter: Boolean
    ): Bitmap {
        return src.scale(dstWidth.toInt(), dstHeight.toInt(), filter)
    }

    override fun asShared(pigeon_instance: Bitmap): Bitmap {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) pigeon_instance.asShared()
        else throw UnsupportedOperationException("Call requires API level 31")
    }

    override fun compress(
        pigeon_instance: Bitmap,
        format: BitmapCompressFormatApi,
        quality: Long,
        stream: OutputStream
    ): Boolean {
        return pigeon_instance.compress(format.impl, quality.toInt(), stream)
    }

    override fun copy(
        pigeon_instance: Bitmap,
        config: BitmapConfigApi,
        isMutalbe: Boolean
    ): Bitmap {
        return pigeon_instance.copy(config.impl, isMutalbe)
    }

    override fun copyPixelsFromBuffer(pigeon_instance: Bitmap, src: Buffer) {
        pigeon_instance.copyPixelsFromBuffer(src)
    }

    override fun copyPixelsToBuffer(pigeon_instance: Bitmap, dst: Buffer) {
        pigeon_instance.copyPixelsToBuffer(dst)
    }

    override fun eraseColor(pigeon_instance: Bitmap, color: Long) {
        pigeon_instance.eraseColor(color.toInt())
    }

    override fun extractAlpha1(pigeon_instance: Bitmap): Bitmap {
        return pigeon_instance.extractAlpha()
    }

    override fun getAllocationByteCount(pigeon_instance: Bitmap): Long {
        return pigeon_instance.allocationByteCount.toLong()
    }

    override fun getByteCount(pigeon_instance: Bitmap): Long {
        return pigeon_instance.byteCount.toLong()
    }

    override fun getConfig(pigeon_instance: Bitmap): BitmapConfigApi? {
        return pigeon_instance.config?.api
    }

    override fun getDensity(pigeon_instance: Bitmap): Long {
        return pigeon_instance.density.toLong()
    }

    override fun getGenerationId(pigeon_instance: Bitmap): Long {
        return pigeon_instance.generationId.toLong()
    }

    override fun getHeight(pigeon_instance: Bitmap): Long {
        return pigeon_instance.height.toLong()
    }

    override fun getNinePatchChunk(pigeon_instance: Bitmap): ByteArray? {
        return pigeon_instance.ninePatchChunk
    }

    override fun getPixel(pigeon_instance: Bitmap, x: Long, y: Long): Long {
        return pigeon_instance[x.toInt(), y.toInt()].toLong()
    }

    override fun getRowBytes(pigeon_instance: Bitmap): Long {
        return pigeon_instance.rowBytes.toLong()
    }

    override fun getScaledHeight1(pigeon_instance: Bitmap, targetDensity: Long): Long {
        return pigeon_instance.getScaledHeight(targetDensity.toInt()).toLong()
    }

    override fun getScaledWidth1(pigeon_instance: Bitmap, targetDensity: Long): Long {
        return pigeon_instance.getScaledWidth(targetDensity.toInt()).toLong()
    }

    override fun getWidth(pigeon_instance: Bitmap): Long {
        return pigeon_instance.width.toLong()
    }

    override fun hasAlpha(pigeon_instance: Bitmap): Boolean {
        return pigeon_instance.hasAlpha()
    }

    override fun hasGainmap(pigeon_instance: Bitmap): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.hasGainmap()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun hasMipMap(pigeon_instance: Bitmap): Boolean {
        return pigeon_instance.hasMipMap()
    }

    override fun isMutable(pigeon_instance: Bitmap): Boolean {
        return pigeon_instance.isMutable
    }

    override fun isPremultiplied(pigeon_instance: Bitmap): Boolean {
        return pigeon_instance.isPremultiplied
    }

    override fun isRecycled(pigeon_instance: Bitmap): Boolean {
        return pigeon_instance.isRecycled
    }

    override fun prepareToDraw(pigeon_instance: Bitmap) {
        pigeon_instance.prepareToDraw()
    }

    override fun reconfigure(
        pigeon_instance: Bitmap,
        width: Long,
        height: Long,
        config: BitmapConfigApi
    ) {
        pigeon_instance.reconfigure(width.toInt(), height.toInt(), config.impl)
    }

    override fun recycle(pigeon_instance: Bitmap) {
        pigeon_instance.recycle()
    }

    override fun sameAs(pigeon_instance: Bitmap, other: Bitmap): Boolean {
        return pigeon_instance.sameAs(other)
    }

    override fun setConfig(
        pigeon_instance: Bitmap,
        config: BitmapConfigApi
    ) {
        return pigeon_instance.setConfig(config.impl)
    }

    override fun setDensity(pigeon_instance: Bitmap, density: Long) {
        pigeon_instance.density = density.toInt()
    }

    override fun setHasAlpha(pigeon_instance: Bitmap, hasAlpha: Boolean) {
        pigeon_instance.setHasAlpha(hasAlpha)
    }

    override fun sethasMipMap(pigeon_instance: Bitmap, hasMipMap: Boolean) {
        pigeon_instance.setHasMipMap(hasMipMap)
    }

    override fun setHeight(pigeon_instance: Bitmap, height: Long) {
        pigeon_instance.height = height.toInt()
    }

    override fun setPixel(
        pigeon_instance: Bitmap,
        x: Long,
        y: Long,
        color: Long
    ) {
        pigeon_instance[x.toInt(), y.toInt()] = color.toInt()
    }

    override fun setPremultiplied(pigeon_instance: Bitmap, premultiplied: Boolean) {
        pigeon_instance.isPremultiplied = premultiplied
    }

    override fun setWidth(pigeon_instance: Bitmap, width: Long) {
        pigeon_instance.width = width.toInt()
    }
}

val BitmapConfigApi.impl: Bitmap.Config
    get() = when (this) {
        BitmapConfigApi.ALPHA8 -> Bitmap.Config.ALPHA_8
        BitmapConfigApi.ARGB4444 -> Bitmap.Config.ARGB_4444
        BitmapConfigApi.ARGB8888 -> Bitmap.Config.ARGB_8888
        BitmapConfigApi.HARDWARE -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) Bitmap.Config.HARDWARE
        else throw UnsupportedOperationException("Field requires API level 26")

        BitmapConfigApi.RGBA1010102 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) Bitmap.Config.RGBA_1010102
        else throw UnsupportedOperationException("Field requires API level 33")

        BitmapConfigApi.RGBA_F16 -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) Bitmap.Config.RGBA_F16
        else throw UnsupportedOperationException("Field requires API level 26")

        BitmapConfigApi.RGB565 -> Bitmap.Config.RGB_565
    }

val Bitmap.Config.api: BitmapConfigApi
    get() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            when (this) {
                Bitmap.Config.RGBA_1010102 -> return BitmapConfigApi.RGBA1010102
                else -> {}
            }
        }
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            when (this) {
                Bitmap.Config.RGBA_F16 -> return BitmapConfigApi.RGBA_F16
                Bitmap.Config.HARDWARE -> return BitmapConfigApi.HARDWARE
                else -> {}
            }
        }
        return when (this) {
            Bitmap.Config.ALPHA_8 -> BitmapConfigApi.ALPHA8
            Bitmap.Config.RGB_565 -> BitmapConfigApi.RGB565
            Bitmap.Config.ARGB_4444 -> BitmapConfigApi.ARGB4444
            Bitmap.Config.ARGB_8888 -> BitmapConfigApi.ARGB8888
            else -> throw NotImplementedError("Not implemented value: $this")
        }
    }

val BitmapCompressFormatApi.impl: Bitmap.CompressFormat
    get() = when (this) {
        BitmapCompressFormatApi.JPEG -> Bitmap.CompressFormat.JPEG
        BitmapCompressFormatApi.PNG -> Bitmap.CompressFormat.PNG
        BitmapCompressFormatApi.WEBP -> Bitmap.CompressFormat.WEBP
        BitmapCompressFormatApi.WEBP_LOSSLESS -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) Bitmap.CompressFormat.WEBP_LOSSLESS
        else throw UnsupportedOperationException("Field requires API level 30")

        BitmapCompressFormatApi.WEBP_LOSSY -> if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) Bitmap.CompressFormat.WEBP_LOSSY
        else throw UnsupportedOperationException("Field requires API level 30")
    }