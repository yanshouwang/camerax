package dev.hebei.camerax_android.legacy.ml

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiDetector

class Detector(registrar: CameraXRegistrar) : PigeonApiDetector(registrar) {
    abstract class Stub internal constructor(internal open val obj: com.google.mlkit.vision.interfaces.Detector<*>)
}