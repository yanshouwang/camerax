package dev.hebei.camerax_android.view

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.CoordinateSystemApi
import dev.hebei.camerax_android.PigeonApiJpegAnalyzerApi
import dev.hebei.camerax_android.core.impl

class JpegAnalyzerImpl(registrar: CameraXRegistrar) : PigeonApiJpegAnalyzerApi(registrar) {
    override fun pigeon_defaultConstructor(targetCoordinateSystem: CoordinateSystemApi): androidx.camera.core.ImageAnalysis.Analyzer {
        return Impl(this, targetCoordinateSystem)
    }

    class Impl(
        private val api: JpegAnalyzerImpl, private val targetCoordinateSystem: CoordinateSystemApi
    ) : androidx.camera.core.ImageAnalysis.Analyzer {
        private var matrix: android.graphics.Matrix? = null

        override fun getTargetCoordinateSystem(): Int {
            return targetCoordinateSystem.impl
        }

        override fun updateTransform(matrix: android.graphics.Matrix?) {
            super.updateTransform(matrix)
            this.matrix = matrix
        }

        override fun analyze(image: androidx.camera.core.ImageProxy) {
            val source = image.toBitmap()
            val bitmap = android.graphics.Bitmap.createBitmap(
                source, 0, 0, source.width, source.height, matrix, true
            )
            val stream = java.io.ByteArrayOutputStream()
            val compressed = bitmap.compress(android.graphics.Bitmap.CompressFormat.JPEG, 100, stream)
            if (!compressed) {
                throw IllegalStateException("Encode bitmap failed.")
            }
            source.recycle()
            bitmap.recycle()
            val value = stream.toByteArray()
            api.consumer(this, value) {
                image.close()
            }
        }
    }
}