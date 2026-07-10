package dev.zeekr.camerax_android.common

import android.view.View
import androidx.core.view.isGone
import androidx.core.view.isInvisible
import androidx.core.view.isVisible
import dev.zeekr.camerax_android.CameraXApiPigeonProxyApiRegistrar
import dev.zeekr.camerax_android.PigeonApiViewProxyApi
import dev.zeekr.camerax_android.ViewVisibilityApi

class ViewImpl(registrar: CameraXApiPigeonProxyApiRegistrar) : PigeonApiViewProxyApi(registrar) {
    override fun getVisibility(pigeon_instance: View): ViewVisibilityApi {
        return pigeon_instance.visibility.viewVisibilityApi
    }

    override fun setVisibility(pigeon_instance: View, value: ViewVisibilityApi) {
        pigeon_instance.visibility = value.impl
    }

    override fun getAlpha(pigeon_instance: View): Double {
        return pigeon_instance.alpha.toDouble()
    }

    override fun setAlpha(pigeon_instance: View, value: Double) {
        pigeon_instance.alpha = value.toFloat()
    }

    override fun isVisible(pigeon_instance: View): Boolean {
        return pigeon_instance.isVisible
    }

    override fun isInvisible(pigeon_instance: View): Boolean {
        return pigeon_instance.isInvisible
    }

    override fun isGone(pigeon_instance: View): Boolean {
        return pigeon_instance.isGone
    }

    override fun isOpaque(pigeon_instance: View): Boolean {
        return pigeon_instance.isOpaque
    }

    override fun setVisible(pigeon_instance: View, value: Boolean) {
        pigeon_instance.isVisible = value
    }

    override fun setInvisible(pigeon_instance: View, value: Boolean) {
        pigeon_instance.isInvisible = value
    }

    override fun setGone(pigeon_instance: View, value: Boolean) {
        pigeon_instance.isGone = value
    }
}

val Int.viewVisibilityApi: ViewVisibilityApi
    get() = when (this) {
        View.VISIBLE -> ViewVisibilityApi.VISIBLE
        View.INVISIBLE -> ViewVisibilityApi.INVISIBLE
        View.GONE -> ViewVisibilityApi.GONE
        else -> throw NotImplementedError("Not implemented value: $this")
    }

val ViewVisibilityApi.impl: Int
    get() = when (this) {
        ViewVisibilityApi.VISIBLE -> View.VISIBLE
        ViewVisibilityApi.INVISIBLE -> View.INVISIBLE
        ViewVisibilityApi.GONE -> View.GONE
    }