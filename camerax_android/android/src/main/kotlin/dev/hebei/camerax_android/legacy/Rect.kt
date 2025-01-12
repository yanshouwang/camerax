package dev.hebei.camerax_android.legacy

class Rect(registrar: CameraXRegistrar) : PigeonApiRect(registrar) {
    override fun pigeon_defaultConstructor(left: Long, top: Long, right: Long, bottom: Long): android.graphics.Rect {
        return android.graphics.Rect(left.toInt(), top.toInt(), right.toInt(), bottom.toInt())
    }

    override fun getWidth(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.width().toLong()
    }

    override fun getHeight(pigeon_instance: android.graphics.Rect): Long {
        return pigeon_instance.height().toLong()
    }
}