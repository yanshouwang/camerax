package dev.zeekr.camerax_android.ml

import dev.zeekr.camerax_android.CameraXImpl
import dev.zeekr.camerax_android.PigeonApiDetectorApi

class DetectorImpl(impl: CameraXImpl) : PigeonApiDetectorApi(impl)

abstract class Detector internal constructor(internal open val instance: com.google.mlkit.vision.interfaces.Detector<*>)