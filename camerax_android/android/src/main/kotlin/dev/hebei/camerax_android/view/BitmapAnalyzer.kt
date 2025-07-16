package dev.hebei.camerax_android.view

import android.graphics.Bitmap
import android.graphics.Matrix
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import androidx.core.util.Consumer

class BitmapAnalyzer(private val consumer: Consumer<Bitmap>) : ImageAnalysis.Analyzer {
    private var matrix: Matrix? = null

    override fun getTargetCoordinateSystem(): Int {
        return ImageAnalysis.COORDINATE_SYSTEM_VIEW_REFERENCED
    }

    override fun updateTransform(matrix: Matrix?) {
        super.updateTransform(matrix)
        this.matrix = matrix
    }

    override fun analyze(image: ImageProxy) {
        try {
            val source = image.toBitmap()
            val x = 0
            val y = 0
            val width = source.width
            val height = source.height
            val m = matrix
            val filter = true
            val bitmap = Bitmap.createBitmap(source, x, y, width, height, m, filter)
            consumer.accept(bitmap)
        } finally {
            image.close()
        }
    }
}