package dev.zeekr.camerax_android.common

import android.location.Location
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiLocationApi

class LocationImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiLocationApi(registrar) {
    override fun pigeon_defaultConstructor(latitude: Double, longitude: Double): Location {
        return Location(null).apply {
            this.latitude = latitude
            this.longitude = longitude
        }
    }

    override fun latitude(pigeon_instance: Location): Double {
        return pigeon_instance.latitude
    }

    override fun longitude(pigeon_instance: Location): Double {
        return pigeon_instance.longitude
    }
}