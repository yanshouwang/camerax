package dev.hebei.camerax_android.ml

import dev.hebei.camerax_android.CameraXImpl
import dev.hebei.camerax_android.PigeonApiDetectorApi

class DetectorImpl(impl: CameraXImpl) : PigeonApiDetectorApi(impl)

abstract class Detector internal constructor(internal open val instance: com.google.mlkit.vision.interfaces.Detector<*>)