package dev.yanshouwang.camerax

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraxPlugin */
class CameraPlugin : FlutterPlugin, ActivityAware {
    private lateinit var cameraProviderPigeon: CameraProviderPigeon
    private lateinit var cameraViewPigeon: CameraViewPigeon

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        val cameraViewType = "dev.yanshouwang.camerax/camera_view"
        binding.platformViewRegistry.registerViewFactory(cameraViewType, CameraViewFactory)
        cameraProviderPigeon = CameraProviderPigeon()
        cameraViewPigeon = CameraViewPigeon()
        Pigeons.CameraProviderHostPigeon.setup(binding.binaryMessenger, cameraProviderPigeon)
        Pigeons.CameraViewHostPigeon.setup(binding.binaryMessenger, cameraViewPigeon)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        cameraProviderPigeon.activity = binding.activity
        cameraViewPigeon.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        cameraProviderPigeon.activity = null
        cameraViewPigeon.activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        cameraProviderPigeon.activity = binding.activity
        cameraViewPigeon.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        cameraProviderPigeon.activity = null
        cameraViewPigeon.activity = null
    }
}
