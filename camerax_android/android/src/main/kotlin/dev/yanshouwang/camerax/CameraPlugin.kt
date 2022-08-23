package dev.yanshouwang.camerax

import android.app.Activity
import androidx.annotation.NonNull
import dev.yanshouwang.camerax.pigeons.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformViewRegistry
import java.util.concurrent.Executors

/** CameraPlugin */
class CameraPlugin : FlutterPlugin, ActivityAware {
    private val executor by lazy { Executors.newSingleThreadExecutor() }
    private val finalizerPigeon by lazy { FinalizerPigeon() }
    private val cameraControllerPigeon by lazy { CameraControllerPigeon(executor) }
    private val imageAnalyzerPigeon by lazy { ImageAnalyzerPigeon() }
    private val mlAnalyzerPigeon by lazy { MLAnalyzerPigeon(executor) }
    private val cameraViewPigeon by lazy { CameraViewPigeon() }

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        registerViews(binding.platformViewRegistry)
        setupPigeons(binding.binaryMessenger)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setActivity(binding.activity)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        setActivity(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setActivity(binding.activity)
    }

    override fun onDetachedFromActivity() {
        setActivity(null)
    }

    private fun registerViews(registry: PlatformViewRegistry) {
        registry.registerViewFactory(CameraViewFactory.viewType, CameraViewFactory)
    }

    private fun setupPigeons(binaryMessenger: BinaryMessenger) {
        cameraControllerPigeon.binaryMessenger = binaryMessenger
        imageAnalyzerPigeon.binaryMessenger = binaryMessenger
        mlAnalyzerPigeon.binaryMessenger = binaryMessenger

        Pigeons.FinalizerHostPigeon.setup(binaryMessenger, finalizerPigeon)
        Pigeons.CameraControllerHostPigeon.setup(binaryMessenger, cameraControllerPigeon)
        Pigeons.ImageAnalyzerHostPigeon.setup(binaryMessenger, imageAnalyzerPigeon)
        Pigeons.MLAnalyzerHostPigeon.setup(binaryMessenger, mlAnalyzerPigeon)
        Pigeons.CameraViewHostPigeon.setup(binaryMessenger, cameraViewPigeon)
    }

    private fun setActivity(activity: Activity?) {
        cameraControllerPigeon.activity = activity
        cameraViewPigeon.activity = activity
    }
}
