package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiUri

class Uri(registrar: CameraXRegistrar) : PigeonApiUri(registrar) {
    override fun parse(uriString: String): android.net.Uri {
        return android.net.Uri.parse(uriString)
    }

    override fun getPath(pigeon_instance: android.net.Uri): String? {
        return pigeon_instance.path
    }
}