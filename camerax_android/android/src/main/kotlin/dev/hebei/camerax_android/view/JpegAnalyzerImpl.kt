package dev.hebei.camerax_android.view

import android.graphics.Bitmap
import android.graphics.Matrix
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.CoordinateSystemApi
import dev.hebei.camerax_android.PigeonApiJpegAnalyzerApi
import dev.hebei.camerax_android.core.impl
import java.io.ByteArrayOutputStream

class JpegAnalyzerImpl(impl: CameraXImpl) : PigeonApiJpegAnalyzerApi(impl) {
    override fun pigeon_defaultConstructor(targetCoordinateSystem: CoordinateSystemApi): ImageAnalysis.Analyzer {
        return object : ImageAnalysis.Analyzer {
            private var matrix: Matrix? = null

            override fun getTargetCoordinateSystem(): Int {
                return targetCoordinateSystem.impl
            }

            override fun updateTransform(matrix: Matrix?) {
                super.updateTransform(matrix)
                this.matrix = matrix
            }

            override fun analyze(image: ImageProxy) {
                val source = image.toBitmap()
                val bitmap = Bitmap.createBitmap(
                    source, 0, 0, source.width, source.height, matrix, true
                )
                val stream = ByteArrayOutputStream()
                val compressed = bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream)
                if (!compressed) {
                    throw IllegalStateException("Encode bitmap failed.")
                }
                source.recycle()
                bitmap.recycle()
                val value = stream.toByteArray()
                this@JpegAnalyzerImpl.consumer(this, value) {
                    image.close()
                }
            }
        }
    }
}