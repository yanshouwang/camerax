package dev.hebei.camerax_android.legacy.common

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiLocation

class Location(registrar: CameraXRegistrar) : PigeonApiLocation(registrar) {
    override fun pigeon_defaultConstructor(latitude: Double, longitude: Double): android.location.Location {
        return android.location.Location(null).apply {
            this.latitude = latitude
            this.longitude = longitude
        }
    }

    override fun latitude(pigeon_instance: android.location.Location): Double {
        return pigeon_instance.latitude
    }

    override fun longitude(pigeon_instance: android.location.Location): Double {
        return pigeon_instance.longitude
    }
}