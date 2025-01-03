package dev.hebei.camerax_android.legacy.core

import androidx.lifecycle.LiveData
import androidx.lifecycle.Observer
import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiLiveData

class LiveData(private val registrar: CameraXRegistrar) : PigeonApiLiveData(registrar) {
    override fun getValue(pigeon_instance: androidx.lifecycle.LiveData<*>): Any {
        val value = pigeon_instance.value
        return if (value is dev.hebei.camerax_android.core.ZoomState) value
        else throw TypeCastException()
    }

    override fun observe(pigeon_instance: LiveData<*>, observer: Observer<*>) {
        val owner = registrar.activity as androidx.lifecycle.LifecycleOwner
        pigeon_instance.observe(owner, observer)
    }

    override fun removeObserver(
        pigeon_instance: androidx.lifecycle.LiveData<*>, observer: androidx.lifecycle.Observer<*>
    ) {
        pigeon_instance.removeObserver(observer)
    }
}