package dev.zeekr.camerax_android.common

import android.location.Location
import android.os.Build
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.LocationFormatApi
import dev.zeekr.camerax_android.PigeonApiLocationProxyApi

class LocationImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiLocationProxyApi(registrar) {
    override fun location(location: Location): Location {
        return Location(location)
    }

    override fun provider(provider: String?): Location {
        return Location(provider)
    }

    override fun convert1(coordinate: Double, outputType: LocationFormatApi): String {
        return Location.convert(coordinate, outputType.impl)
    }

    override fun convert2(coordinate: String): Double {
        return Location.convert(coordinate)
    }

    override fun bearingTo(pigeon_instance: Location, dest: Location): Double {
        return pigeon_instance.bearingTo(dest).toDouble()
    }

    override fun distanceTo(pigeon_instance: Location, dest: Location): Double {
        return pigeon_instance.distanceTo(dest).toDouble()
    }

    override fun getAccuracy(pigeon_instance: Location): Double {
        return pigeon_instance.accuracy.toDouble()
    }

    override fun getAltitude(pigeon_instance: Location): Double {
        return pigeon_instance.altitude
    }

    override fun getBearing(pigeon_instance: Location): Double {
        return pigeon_instance.bearing.toDouble()
    }

    override fun getBearingAccuracyDegrees(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.bearingAccuracyDegrees.toDouble()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun getElapsedRealtimeAgeMillis1(pigeon_instance: Location): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.elapsedRealtimeAgeMillis
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun getElapsedRealtimeAgeMillis2(pigeon_instance: Location, referenceRealtimeMs: Long): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            pigeon_instance.getElapsedRealtimeAgeMillis(referenceRealtimeMs)
        } else {
            throw UnsupportedOperationException("Call requires API level 33")
        }
    }

    override fun getElapsedRealtimeMillis(pigeon_instance: Location): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.elapsedRealtimeMillis
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun getElapsedRealtimeNanos(pigeon_instance: Location): Long {
        return pigeon_instance.elapsedRealtimeNanos
    }

    override fun getElapsedRealtimeUncertaintyNanos(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) pigeon_instance.elapsedRealtimeUncertaintyNanos
        else throw UnsupportedOperationException("Call requires API level 29")
    }

    override fun getLatitude(pigeon_instance: Location): Double {
        return pigeon_instance.latitude
    }

    override fun getLongitude(pigeon_instance: Location): Double {
        return pigeon_instance.longitude
    }

    override fun getMslAltitudeAccuracyMeters(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.mslAltitudeAccuracyMeters.toDouble()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun getMslAltitudeMeters(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.mslAltitudeMeters
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun getProvider(pigeon_instance: Location): String? {
        return pigeon_instance.provider
    }

    override fun getSpeed(pigeon_instance: Location): Double {
        return pigeon_instance.speed.toDouble()
    }

    override fun getSpeedAccuracyMetersPerSecond(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.speedAccuracyMetersPerSecond.toDouble()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun getTime(pigeon_instance: Location): Long {
        return pigeon_instance.time
    }

    override fun getVerticalAccuracyMeters(pigeon_instance: Location): Double {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.verticalAccuracyMeters.toDouble()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun hasAccuracy(pigeon_instance: Location): Boolean {
        return pigeon_instance.hasAccuracy()
    }

    override fun hasAltitude(pigeon_instance: Location): Boolean {
        return pigeon_instance.hasAltitude()
    }

    override fun hasBearing(pigeon_instance: Location): Boolean {
        return pigeon_instance.hasBearing()
    }

    override fun hasBearingAccuracy(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.hasBearingAccuracy()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun hasElapsedRealtimeUncertaintyNanos(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) pigeon_instance.hasElapsedRealtimeUncertaintyNanos()
        else throw UnsupportedOperationException("Call requires API level 29")
    }

    override fun hasMslAltitude(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.hasMslAltitude()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun hasMslAltitudeAccuracy(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.hasMslAltitudeAccuracy()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun hasSpeed(pigeon_instance: Location): Boolean {
        return pigeon_instance.hasSpeed()
    }

    override fun hasSpeedAccuracy(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.hasSpeedAccuracy()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun hasVerticalAccuracy(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) pigeon_instance.hasVerticalAccuracy()
        else throw UnsupportedOperationException("Call requires API level 26")
    }

    override fun isComplete(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.isComplete
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun isFromMockProvider(pigeon_instance: Location): Boolean {
        return pigeon_instance.isFromMockProvider
    }

    override fun isMock(pigeon_instance: Location): Boolean {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) pigeon_instance.isMock
        else pigeon_instance.isFromMockProvider

    }

    override fun removeAccuracy(pigeon_instance: Location) {
        pigeon_instance.removeAccuracy()
    }

    override fun removeAltitude(pigeon_instance: Location) {
        pigeon_instance.removeAltitude()
    }

    override fun removeBearing(pigeon_instance: Location) {
        pigeon_instance.removeBearing()
    }

    override fun removeBearingAccuracy(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.removeBearingAccuracy()
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun removeElapsedRealtimeUncertaintyNanos(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.removeElapsedRealtimeUncertaintyNanos()
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun removeMslAltitude(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.removeMslAltitude()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun removeMslAltitudeAccuracy(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) pigeon_instance.removeMslAltitudeAccuracy()
        else throw UnsupportedOperationException("Call requires API level 34")
    }

    override fun removeSpeed(pigeon_instance: Location) {
        pigeon_instance.removeSpeed()
    }

    override fun removeSpeedAccuracy(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.removeSpeedAccuracy()
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun removeVerticalAccuracy(pigeon_instance: Location) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) pigeon_instance.removeVerticalAccuracy()
        else throw UnsupportedOperationException("Call requires API level 33")
    }

    override fun reset(pigeon_instance: Location) {
        pigeon_instance.reset()
    }

    override fun set(pigeon_instance: Location, location: Location) {
        pigeon_instance.set(location)
    }

    override fun setAccuracy(pigeon_instance: Location, horizontalAccuracyMeters: Double) {
        pigeon_instance.accuracy = horizontalAccuracyMeters.toFloat()
    }

    override fun setAltitude(pigeon_instance: Location, altitudeMeters: Double) {
        pigeon_instance.altitude = altitudeMeters
    }

    override fun setBearing(pigeon_instance: Location, bearingDegrees: Double) {
        pigeon_instance.bearing = bearingDegrees.toFloat()
    }

    override fun setBearingAccuracyDegrees(pigeon_instance: Location, bearingAccuracyDegrees: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            pigeon_instance.bearingAccuracyDegrees = bearingAccuracyDegrees.toFloat()
        } else {
            throw UnsupportedOperationException("Call requires API level 26")
        }
    }

    override fun setElapsedRealtimeNanos(pigeon_instance: Location, elapsedRealtimeNs: Long) {
        pigeon_instance.elapsedRealtimeNanos = elapsedRealtimeNs
    }

    override fun setElapsedRealtimeUncertaintyNanos(pigeon_instance: Location, elapsedRealtimeUncertaintyNs: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            pigeon_instance.elapsedRealtimeUncertaintyNanos = elapsedRealtimeUncertaintyNs
        } else {
            throw UnsupportedOperationException("Call requires API level 29")
        }
    }

    override fun setLatitude(pigeon_instance: Location, latitudeDegrees: Double) {
        pigeon_instance.latitude = latitudeDegrees
    }

    override fun setLongitude(pigeon_instance: Location, longitudeDegrees: Double) {
        pigeon_instance.longitude = longitudeDegrees
    }

    override fun setMock(pigeon_instance: Location, mock: Boolean) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) pigeon_instance.isMock = mock
        else throw UnsupportedOperationException("Call requires API level 31")
    }

    override fun setMslAltitudeAccuracyMeters(pigeon_instance: Location, mslAltitudeAccuracyMeters: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            pigeon_instance.mslAltitudeAccuracyMeters = mslAltitudeAccuracyMeters.toFloat()
        } else {
            throw UnsupportedOperationException("Call requires API level 34")
        }
    }

    override fun setMslAltitudeMeters(pigeon_instance: Location, mslAltitudeMeters: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            pigeon_instance.mslAltitudeMeters = mslAltitudeMeters
        } else {
            throw UnsupportedOperationException("Call requires API level 34")
        }
    }

    override fun setProvider(pigeon_instance: Location, provider: String?) {
        pigeon_instance.provider = provider
    }

    override fun setSpeed(pigeon_instance: Location, speedMetersPerSecond: Double) {
        pigeon_instance.speed = speedMetersPerSecond.toFloat()
    }

    override fun setSpeedAccuracyMetersPerSecond(pigeon_instance: Location, speedAccuracyMeterPerSecond: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            pigeon_instance.speedAccuracyMetersPerSecond = speedAccuracyMeterPerSecond.toFloat()
        } else {
            throw UnsupportedOperationException("Call requires API level 26")
        }
    }

    override fun setTime(pigeon_instance: Location, timeMs: Long) {
        pigeon_instance.time = timeMs
    }

    override fun setVerticalAccuracyMeters(pigeon_instance: Location, altitudeAccuracyMeters: Double) {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            pigeon_instance.verticalAccuracyMeters = altitudeAccuracyMeters.toFloat()
        } else {
            throw UnsupportedOperationException("Call requires API level 26")
        }
    }
}

val LocationFormatApi.impl: Int
    get() = when (this) {
        LocationFormatApi.DEGREES -> Location.FORMAT_DEGREES
        LocationFormatApi.MINUTES -> Location.FORMAT_MINUTES
        LocationFormatApi.SECONDS -> Location.FORMAT_SECONDS
    }