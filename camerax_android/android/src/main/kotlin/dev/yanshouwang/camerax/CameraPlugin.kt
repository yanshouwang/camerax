package dev.yanshouwang.camerax

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** CameraxPlugin */
class CameraPlugin : FlutterPlugin, ActivityAware {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var cameraProviderPigeon: CameraProviderPigeon

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        val cameraViewType = "dev.yanshouwang.camerax/camera_view"
        val cameraViewFactory = CameraViewFactory()
        binding.platformViewRegistry.registerViewFactory(cameraViewType, cameraViewFactory)
        cameraProviderPigeon = CameraProviderPigeon(cameraViewFactory)
        Pigeons.CameraProviderHostPigeon.setup(binding.binaryMessenger, cameraProviderPigeon)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        cameraProviderPigeon.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        cameraProviderPigeon.activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        cameraProviderPigeon.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        cameraProviderPigeon.activity = null
    }
}
