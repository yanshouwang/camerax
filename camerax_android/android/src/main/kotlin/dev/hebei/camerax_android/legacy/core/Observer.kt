package dev.hebei.camerax_android.legacy.core

import dev.hebei.camerax_android.legacy.CameraXRegistrar
import dev.hebei.camerax_android.legacy.PigeonApiObserver

class Observer(registrar: CameraXRegistrar) : PigeonApiObserver(registrar) {
    override fun pigeon_defaultConstructor(): androidx.lifecycle.Observer<*> {
        return object : androidx.lifecycle.Observer<dev.hebei.camerax_android.core.ZoomState?> {
            override fun onChanged(value: dev.hebei.camerax_android.core.ZoomState?) {
                this@Observer.onChanged(this, value) {}
            }
        }
    }
}