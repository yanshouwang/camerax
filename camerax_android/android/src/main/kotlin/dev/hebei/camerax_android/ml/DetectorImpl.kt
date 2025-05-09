package dev.hebei.camerax_android.ml

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiDetectorApi

class DetectorImpl(registrar: CameraXRegistrar) : PigeonApiDetectorApi(registrar)

abstract class Detector internal constructor(internal open val obj: com.google.mlkit.vision.interfaces.Detector<*>)