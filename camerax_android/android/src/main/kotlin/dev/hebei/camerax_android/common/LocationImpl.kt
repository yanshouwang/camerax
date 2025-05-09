package dev.hebei.camerax_android.common

import dev.hebei.camerax_android.CameraXRegistrar
import dev.hebei.camerax_android.PigeonApiLocationApi

class LocationImpl(registrar: CameraXRegistrar) : PigeonApiLocationApi(registrar) {
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