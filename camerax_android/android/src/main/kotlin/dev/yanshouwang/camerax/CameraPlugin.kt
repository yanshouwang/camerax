package dev.yanshouwang.camerax

import android.app.Activity
import androidx.annotation.NonNull
import dev.yanshouwang.camerax.pigeons.*

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.platform.PlatformViewRegistry

/** CameraPlugin */
class CameraPlugin : FlutterPlugin, ActivityAware {
    private val finalizerPigeon by lazy { FinalizerPigeon() }
    private val cameraViewPigeon by lazy { CameraViewPigeon() }
    private val cameraControllerPigeon by lazy { CameraControllerPigeon() }
    private val imageAnalyzerPigeon by lazy { ImageAnalyzerPigeon() }
    private val mlAnalyzerPigeon by lazy { MLAnalyzerPigeon() }

    override fun onAttachedToEngine(@NonNull binding: FlutterPluginBinding) {
        registerViews(binding)
        setupPigeons(binding)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPluginBinding) {
        teardownPigeons(binding)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setActivity(binding)
    }

    override fun onDetachedFromActivityForConfigChanges() {
        setActivity(null)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setActivity(binding)
    }

    override fun onDetachedFromActivity() {
        setActivity(null)
    }

    private fun registerViews(binding: FlutterPluginBinding) {
        binding.platformViewRegistry.registerViewFactory(CameraViewFactory.viewType, CameraViewFactory)
    }

    private fun setupPigeons(binding: FlutterPluginBinding) {
        cameraControllerPigeon.context = binding.applicationContext
        mlAnalyzerPigeon.context = binding.applicationContext

        cameraControllerPigeon.binaryMessenger = binding.binaryMessenger
        imageAnalyzerPigeon.binaryMessenger = binding.binaryMessenger
        mlAnalyzerPigeon.binaryMessenger = binding.binaryMessenger

        Pigeons.FinalizerHostPigeon.setup(binding.binaryMessenger, finalizerPigeon)
        Pigeons.CameraViewHostPigeon.setup(binding.binaryMessenger, cameraViewPigeon)
        Pigeons.CameraControllerHostPigeon.setup(binding.binaryMessenger, cameraControllerPigeon)
        Pigeons.ImageAnalyzerHostPigeon.setup(binding.binaryMessenger, imageAnalyzerPigeon)
        Pigeons.MLAnalyzerHostPigeon.setup(binding.binaryMessenger, mlAnalyzerPigeon)
    }

    private fun teardownPigeons(binding: FlutterPluginBinding) {
        Pigeons.FinalizerHostPigeon.setup(binding.binaryMessenger, null)
        Pigeons.CameraViewHostPigeon.setup(binding.binaryMessenger, null)
        Pigeons.CameraControllerHostPigeon.setup(binding.binaryMessenger, null)
        Pigeons.ImageAnalyzerHostPigeon.setup(binding.binaryMessenger, null)
        Pigeons.MLAnalyzerHostPigeon.setup(binding.binaryMessenger, null)
    }

    private fun setActivity(binding: ActivityPluginBinding?) {
        cameraViewPigeon.activity = binding?.activity
        cameraControllerPigeon.activity = binding?.activity
    }
}
